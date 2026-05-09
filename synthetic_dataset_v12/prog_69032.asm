; DESCRIPTION: Composite: Draws a white line from (223, 165) to (51, 111) then Renders a blue box of size 51x57 starting at (377, 91) then Sets a single green pixel at (33, 123).
; PLAN: r0=223(x1), r1=165(y1), r2=51(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=91(y), r7=51(width), r8=57(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=33(x), r11=123(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 223
LDI r1, 165
LDI r2, 51
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 91
LDI r7, 51
LDI r8, 57
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 123
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
