; DESCRIPTION: Draws a green line from (10, 111) to (433, 217).
; PLAN: r0=10(x1), r1=111(y1), r2=433(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 111
LDI r2, 433
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
