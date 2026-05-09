; DESCRIPTION: Renders a orange line between points (176, 64) and (221, 220).
; PLAN: r0=176(x1), r1=64(y1), r2=221(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 64
LDI r2, 221
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
