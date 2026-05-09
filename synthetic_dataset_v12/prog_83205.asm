; DESCRIPTION: Draws a yellow line from (475, 86) to (193, 199).
; PLAN: r0=475(x1), r1=86(y1), r2=193(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 86
LDI r2, 193
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
