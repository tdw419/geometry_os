; DESCRIPTION: Draws a orange line from (44, 59) to (8, 255).
; PLAN: r0=44(x1), r1=59(y1), r2=8(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 59
LDI r2, 8
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
