; DESCRIPTION: Draws a orange line from (304, 14) to (82, 196).
; PLAN: r0=304(x1), r1=14(y1), r2=82(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 14
LDI r2, 82
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
