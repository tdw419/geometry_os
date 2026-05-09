; DESCRIPTION: Composite: Places a purple 89x60 rectangle at position (310, 49) then Places a purple line segment connecting (283, 130) to (432, 86).
; PLAN: r0=310(x), r1=49(y), r2=89(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x1), r6=130(y1), r7=432(x2), r8=86(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 49
LDI r2, 89
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 130
LDI r7, 432
LDI r8, 86
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
