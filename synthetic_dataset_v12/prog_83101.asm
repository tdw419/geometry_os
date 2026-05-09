; DESCRIPTION: Composite: Places a blue dot at position (342, 65) then Draws a red line from (243, 171) to (312, 33) then Renders a cyan disk with center (123, 178) and radius 51.
; PLAN: r0=342(x), r1=65(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=243(x1), r6=171(y1), r7=312(x2), r8=33(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=123(x), r11=178(y), r12=51(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 342
LDI r1, 65
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 243
LDI r6, 171
LDI r7, 312
LDI r8, 33
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 178
LDI r12, 51
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
