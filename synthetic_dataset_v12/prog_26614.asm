; DESCRIPTION: Draws a purple line from (494, 221) to (462, 36).
; PLAN: r0=494(x1), r1=221(y1), r2=462(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 221
LDI r2, 462
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
