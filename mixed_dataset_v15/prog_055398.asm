; DESCRIPTION: Renders a black line between points (301, 211) and (263, 252).
; PLAN: r0=301(x1), r1=211(y1), r2=263(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 211
LDI r2, 263
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
