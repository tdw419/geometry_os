; DESCRIPTION: Draws a magenta line from (389, 157) to (494, 204).
; PLAN: r0=389(x1), r1=157(y1), r2=494(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 157
LDI r2, 494
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
