; DESCRIPTION: Draws a red line from (199, 130) to (137, 67).
; PLAN: r0=199(x1), r1=130(y1), r2=137(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 130
LDI r2, 137
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
