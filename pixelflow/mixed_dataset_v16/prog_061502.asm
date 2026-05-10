; DESCRIPTION: Composite: Renders a purple line between points (373, 208) and (463, 230) then Renders a green box of size 98x11 starting at (374, 20).
; PLAN: r0=373(x1), r1=208(y1), r2=463(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=20(y), r7=98(width), r8=11(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 208
LDI r2, 463
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 20
LDI r7, 98
LDI r8, 11
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
