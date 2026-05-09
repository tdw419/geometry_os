; DESCRIPTION: Draws a red line from (489, 130) to (270, 191).
; PLAN: r0=489(x1), r1=130(y1), r2=270(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 130
LDI r2, 270
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
