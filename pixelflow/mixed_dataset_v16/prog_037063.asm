; DESCRIPTION: Composite: Renders a blue box of size 10x81 starting at (440, 135) then Renders a green line between points (50, 143) and (257, 105).
; PLAN: r0=440(x), r1=135(y), r2=10(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=50(x1), r6=143(y1), r7=257(x2), r8=105(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 135
LDI r2, 10
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 143
LDI r7, 257
LDI r8, 105
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
