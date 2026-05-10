; DESCRIPTION: Draws a orange line from (180, 126) to (318, 16).
; PLAN: r0=180(x1), r1=126(y1), r2=318(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 126
LDI r2, 318
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
