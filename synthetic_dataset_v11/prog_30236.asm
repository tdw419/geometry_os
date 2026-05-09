; DESCRIPTION: Renders a orange line between points (18, 29) and (255, 207).
; PLAN: r0=18(x1), r1=29(y1), r2=255(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 29
LDI r2, 255
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
