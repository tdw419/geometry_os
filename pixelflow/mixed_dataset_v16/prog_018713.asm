; DESCRIPTION: Composite: Renders a yellow box of size 99x63 starting at (323, 142) then Renders a purple line between points (283, 219) and (509, 87).
; PLAN: r0=323(x), r1=142(y), r2=99(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x1), r6=219(y1), r7=509(x2), r8=87(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 142
LDI r2, 99
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 219
LDI r7, 509
LDI r8, 87
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
