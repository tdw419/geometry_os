; DESCRIPTION: Draws a yellow line from (172, 224) to (31, 50).
; PLAN: r0=172(x1), r1=224(y1), r2=31(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 224
LDI r2, 31
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
