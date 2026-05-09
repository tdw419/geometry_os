; DESCRIPTION: Composite: Renders a cyan disk with center (69, 97) and radius 54 then Places a black dot at position (313, 194) then Draws a blue line from (98, 5) to (430, 148).
; PLAN: r0=69(x), r1=97(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=313(x), r6=194(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=98(x1), r11=5(y1), r12=430(x2), r13=148(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 97
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 313
LDI r6, 194
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 98
LDI r11, 5
LDI r12, 430
LDI r13, 148
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
