; DESCRIPTION: Renders a orange line between points (293, 128) and (127, 86).
; PLAN: r0=293(x1), r1=128(y1), r2=127(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 128
LDI r2, 127
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
