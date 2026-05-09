; DESCRIPTION: Composite: Places a white line segment connecting (498, 253) to (356, 108) then Renders a purple box of size 12x109 starting at (314, 5).
; PLAN: r0=498(x1), r1=253(y1), r2=356(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=5(y), r7=12(width), r8=109(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 498
LDI r1, 253
LDI r2, 356
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 5
LDI r7, 12
LDI r8, 109
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
