; DESCRIPTION: Draws a blue line from (449, 72) to (113, 19).
; PLAN: r0=449(x1), r1=72(y1), r2=113(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 72
LDI r2, 113
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
