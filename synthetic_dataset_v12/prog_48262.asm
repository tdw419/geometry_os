; DESCRIPTION: Draws a green line from (494, 112) to (165, 180).
; PLAN: r0=494(x1), r1=112(y1), r2=165(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 112
LDI r2, 165
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
