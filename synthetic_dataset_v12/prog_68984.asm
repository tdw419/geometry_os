; DESCRIPTION: Draws a magenta line from (475, 99) to (230, 184).
; PLAN: r0=475(x1), r1=99(y1), r2=230(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 99
LDI r2, 230
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
