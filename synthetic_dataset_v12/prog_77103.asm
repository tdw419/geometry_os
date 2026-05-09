; DESCRIPTION: Renders a orange line between points (193, 253) and (431, 215).
; PLAN: r0=193(x1), r1=253(y1), r2=431(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 253
LDI r2, 431
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
