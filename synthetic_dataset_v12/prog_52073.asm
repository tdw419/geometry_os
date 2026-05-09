; DESCRIPTION: Composite: Renders a green disk with center (415, 114) and radius 73 then Draws a orange line from (368, 181) to (409, 69).
; PLAN: r0=415(x), r1=114(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x1), r6=181(y1), r7=409(x2), r8=69(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 114
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 181
LDI r7, 409
LDI r8, 69
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
