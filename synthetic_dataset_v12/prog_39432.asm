; DESCRIPTION: Composite: Draws a purple line from (482, 170) to (402, 63) then Creates a white rectangular region at (382, 11) spanning 112 by 80 pixels.
; PLAN: r0=482(x1), r1=170(y1), r2=402(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=11(y), r7=112(width), r8=80(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 482
LDI r1, 170
LDI r2, 402
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 11
LDI r7, 112
LDI r8, 80
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
