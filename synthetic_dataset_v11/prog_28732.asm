; DESCRIPTION: Draws a orange line from (202, 56) to (113, 244).
; PLAN: r0=202(x1), r1=56(y1), r2=113(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 56
LDI r2, 113
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
