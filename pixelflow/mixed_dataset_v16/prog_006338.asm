; DESCRIPTION: Renders a orange line between points (434, 90) and (324, 206).
; PLAN: r0=434(x1), r1=90(y1), r2=324(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 90
LDI r2, 324
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
