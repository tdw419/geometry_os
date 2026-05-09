; DESCRIPTION: Composite: Places a white dot at position (511, 137) then Places a yellow circle of radius 70 at center (305, 121) then Draws a blue line from (125, 149) to (102, 166).
; PLAN: r0=511(x), r1=137(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=121(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=125(x1), r11=149(y1), r12=102(x2), r13=166(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 511
LDI r1, 137
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 305
LDI r6, 121
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 125
LDI r11, 149
LDI r12, 102
LDI r13, 166
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
