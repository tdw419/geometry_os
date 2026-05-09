; DESCRIPTION: Draws a orange line from (63, 196) to (186, 93).
; PLAN: r0=63(x1), r1=196(y1), r2=186(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 196
LDI r2, 186
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
