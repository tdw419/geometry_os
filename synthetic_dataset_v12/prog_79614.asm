; DESCRIPTION: Draws a orange line from (26, 206) to (480, 149).
; PLAN: r0=26(x1), r1=206(y1), r2=480(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 206
LDI r2, 480
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
