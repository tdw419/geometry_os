; DESCRIPTION: Renders a orange line between points (247, 255) and (220, 207).
; PLAN: r0=247(x1), r1=255(y1), r2=220(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 255
LDI r2, 220
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
