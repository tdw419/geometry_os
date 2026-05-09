; DESCRIPTION: Draws a magenta line from (494, 195) to (324, 133).
; PLAN: r0=494(x1), r1=195(y1), r2=324(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 195
LDI r2, 324
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
