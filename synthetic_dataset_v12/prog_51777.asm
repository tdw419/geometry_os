; DESCRIPTION: Draws a orange line from (304, 3) to (7, 113).
; PLAN: r0=304(x1), r1=3(y1), r2=7(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 3
LDI r2, 7
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
