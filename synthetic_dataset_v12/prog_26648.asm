; DESCRIPTION: Draws a orange line from (510, 49) to (480, 234).
; PLAN: r0=510(x1), r1=49(y1), r2=480(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 49
LDI r2, 480
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
