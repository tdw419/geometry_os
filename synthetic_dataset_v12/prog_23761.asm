; DESCRIPTION: Composite: Places a blue line segment connecting (347, 30) to (316, 32) then Renders a cyan box of size 40x29 starting at (463, 126).
; PLAN: r0=347(x1), r1=30(y1), r2=316(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=126(y), r7=40(width), r8=29(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 30
LDI r2, 316
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 126
LDI r7, 40
LDI r8, 29
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
