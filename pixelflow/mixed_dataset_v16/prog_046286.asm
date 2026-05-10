; DESCRIPTION: Composite: Renders a cyan box of size 64x104 starting at (190, 117) then Renders a purple line between points (37, 191) and (35, 23).
; PLAN: r0=190(x), r1=117(y), r2=64(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=37(x1), r6=191(y1), r7=35(x2), r8=23(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 117
LDI r2, 64
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 191
LDI r7, 35
LDI r8, 23
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
