; DESCRIPTION: Draws a orange line from (196, 59) to (0, 7).
; PLAN: r0=196(x1), r1=59(y1), r2=0(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 59
LDI r2, 0
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
