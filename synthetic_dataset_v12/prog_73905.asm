; DESCRIPTION: Composite: Renders a green box of size 12x27 starting at (74, 88) then Places a purple line segment connecting (176, 99) to (192, 204).
; PLAN: r0=74(x), r1=88(y), r2=12(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x1), r6=99(y1), r7=192(x2), r8=204(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 88
LDI r2, 12
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 99
LDI r7, 192
LDI r8, 204
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
