; DESCRIPTION: Draws a blue line from (330, 60) to (494, 87).
; PLAN: r0=330(x1), r1=60(y1), r2=494(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 60
LDI r2, 494
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
