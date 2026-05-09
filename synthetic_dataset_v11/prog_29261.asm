; DESCRIPTION: Draws a orange line from (28, 230) to (86, 204).
; PLAN: r0=28(x1), r1=230(y1), r2=86(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 230
LDI r2, 86
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
