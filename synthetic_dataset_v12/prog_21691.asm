; DESCRIPTION: Composite: Renders a green box of size 75x81 starting at (101, 28) then Renders a white line between points (230, 119) and (254, 179).
; PLAN: r0=101(x), r1=28(y), r2=75(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x1), r6=119(y1), r7=254(x2), r8=179(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 28
LDI r2, 75
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 119
LDI r7, 254
LDI r8, 179
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
