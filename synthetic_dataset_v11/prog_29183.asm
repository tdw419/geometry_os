; DESCRIPTION: Draws a blue line from (6, 221) to (131, 32).
; PLAN: r0=6(x1), r1=221(y1), r2=131(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 221
LDI r2, 131
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
