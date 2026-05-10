; DESCRIPTION: Places a blue line segment connecting (247, 116) to (494, 125).
; PLAN: r0=247(x1), r1=116(y1), r2=494(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 116
LDI r2, 494
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
