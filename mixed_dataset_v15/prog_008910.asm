; DESCRIPTION: Composite: Renders a purple box of size 32x91 starting at (429, 17) then Renders a orange line between points (20, 76) and (227, 72) then Places a magenta dot at position (502, 178).
; PLAN: r0=429(x), r1=17(y), r2=32(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x1), r6=76(y1), r7=227(x2), r8=72(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=502(x), r11=178(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 429
LDI r1, 17
LDI r2, 32
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 76
LDI r7, 227
LDI r8, 72
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 502
LDI r11, 178
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
