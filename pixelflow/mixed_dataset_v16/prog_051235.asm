; DESCRIPTION: Renders a yellow line between points (15, 168) and (193, 219).
; PLAN: r0=15(x1), r1=168(y1), r2=193(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 168
LDI r2, 193
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
