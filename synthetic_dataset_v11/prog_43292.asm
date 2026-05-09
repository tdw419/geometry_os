; DESCRIPTION: Draws a orange line from (126, 207) to (86, 255).
; PLAN: r0=126(x1), r1=207(y1), r2=86(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 207
LDI r2, 86
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
