; DESCRIPTION: Draws a orange line from (277, 39) to (327, 60).
; PLAN: r0=277(x1), r1=39(y1), r2=327(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 39
LDI r2, 327
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
