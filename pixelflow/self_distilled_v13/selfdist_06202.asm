; DESCRIPTION: Draws a orange line from (56, 127) to (307, 86).
; PLAN: r0=56(x1), r1=127(y1), r2=307(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 127
LDI r2, 307
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
