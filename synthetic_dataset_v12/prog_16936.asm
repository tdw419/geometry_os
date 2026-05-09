; DESCRIPTION: Renders a orange line between points (301, 224) and (160, 186).
; PLAN: r0=301(x1), r1=224(y1), r2=160(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 224
LDI r2, 160
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
