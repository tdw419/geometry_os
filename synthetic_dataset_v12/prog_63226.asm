; DESCRIPTION: Renders a orange line between points (57, 255) and (370, 61).
; PLAN: r0=57(x1), r1=255(y1), r2=370(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 255
LDI r2, 370
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
