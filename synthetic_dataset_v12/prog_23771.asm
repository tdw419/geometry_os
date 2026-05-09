; DESCRIPTION: Renders a orange line between points (352, 224) and (206, 167).
; PLAN: r0=352(x1), r1=224(y1), r2=206(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 224
LDI r2, 206
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
