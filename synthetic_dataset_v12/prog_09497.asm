; DESCRIPTION: Composite: Places a green line segment connecting (393, 117) to (344, 63) then Places a orange dot at position (401, 35) then Places a red circle of radius 69 at center (107, 112).
; PLAN: r0=393(x1), r1=117(y1), r2=344(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=35(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=107(x), r11=112(y), r12=69(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 393
LDI r1, 117
LDI r2, 344
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 35
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 107
LDI r11, 112
LDI r12, 69
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
