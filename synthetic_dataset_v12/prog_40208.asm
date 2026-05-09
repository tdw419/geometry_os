; DESCRIPTION: Renders a orange line between points (138, 64) and (309, 204).
; PLAN: r0=138(x1), r1=64(y1), r2=309(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 64
LDI r2, 309
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
