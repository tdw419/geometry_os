; DESCRIPTION: Draws a orange line from (82, 48) to (148, 86).
; PLAN: r0=82(x1), r1=48(y1), r2=148(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 48
LDI r2, 148
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
