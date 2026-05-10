; DESCRIPTION: Composite: Renders a black disk with center (421, 187) and radius 58 then Renders a orange line between points (195, 146) and (393, 117) then Renders a magenta box of size 89x49 starting at (46, 16).
; PLAN: r0=421(x), r1=187(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x1), r6=146(y1), r7=393(x2), r8=117(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=46(x), r11=16(y), r12=89(width), r13=49(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 187
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 146
LDI r7, 393
LDI r8, 117
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 16
LDI r12, 89
LDI r13, 49
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
