; DESCRIPTION: Draws a orange line from (90, 93) to (115, 50).
; PLAN: r0=90(x1), r1=93(y1), r2=115(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 93
LDI r2, 115
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
