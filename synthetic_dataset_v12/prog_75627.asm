; DESCRIPTION: Renders a orange line between points (269, 213) and (110, 197).
; PLAN: r0=269(x1), r1=213(y1), r2=110(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 213
LDI r2, 110
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
