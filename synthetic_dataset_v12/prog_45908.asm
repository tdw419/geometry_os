; DESCRIPTION: Composite: Places a magenta line segment connecting (100, 1) to (471, 84) then Places a cyan 110x113 rectangle at position (17, 100) then Places a green dot at position (168, 179).
; PLAN: r0=100(x1), r1=1(y1), r2=471(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=100(y), r7=110(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=168(x), r11=179(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 100
LDI r1, 1
LDI r2, 471
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 100
LDI r7, 110
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 179
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
