; DESCRIPTION: Renders a orange line between points (278, 57) and (405, 48).
; PLAN: r0=278(x1), r1=57(y1), r2=405(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 57
LDI r2, 405
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
