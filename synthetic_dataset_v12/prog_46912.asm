; DESCRIPTION: Draws a orange line from (48, 119) to (420, 57).
; PLAN: r0=48(x1), r1=119(y1), r2=420(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 119
LDI r2, 420
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
