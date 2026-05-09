; DESCRIPTION: Renders a orange line between points (20, 196) and (52, 186).
; PLAN: r0=20(x1), r1=196(y1), r2=52(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 196
LDI r2, 52
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
