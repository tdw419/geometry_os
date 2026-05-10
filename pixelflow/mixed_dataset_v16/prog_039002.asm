; DESCRIPTION: Draws a orange line from (193, 255) to (124, 48).
; PLAN: r0=193(x1), r1=255(y1), r2=124(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 255
LDI r2, 124
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
