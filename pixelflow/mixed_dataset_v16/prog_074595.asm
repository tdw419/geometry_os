; DESCRIPTION: Renders a black line between points (180, 8) and (429, 74).
; PLAN: r0=180(x1), r1=8(y1), r2=429(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 8
LDI r2, 429
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
