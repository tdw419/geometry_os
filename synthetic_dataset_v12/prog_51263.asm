; DESCRIPTION: Draws a orange line from (45, 82) to (59, 240).
; PLAN: r0=45(x1), r1=82(y1), r2=59(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 82
LDI r2, 59
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
