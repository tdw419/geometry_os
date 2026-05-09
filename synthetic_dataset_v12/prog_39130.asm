; DESCRIPTION: Draws a orange line from (307, 77) to (326, 47).
; PLAN: r0=307(x1), r1=77(y1), r2=326(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 77
LDI r2, 326
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
