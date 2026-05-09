; DESCRIPTION: Composite: Creates a cyan circular shape at (184, 152) with radius 12 then Places a purple line segment connecting (63, 130) to (308, 203).
; PLAN: r0=184(x), r1=152(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x1), r6=130(y1), r7=308(x2), r8=203(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 152
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 130
LDI r7, 308
LDI r8, 203
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
