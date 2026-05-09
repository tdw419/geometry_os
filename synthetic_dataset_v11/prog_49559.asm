; DESCRIPTION: Composite: . Then Places a red dot at position (145, 62). Then Places a blue line segment connecting (76, 213) to (221, 74).
; PLAN: r0=145(x), r1=62(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=76(x1), r1=213(y1), r2=221(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (145, 62).
; PLAN: r0=145(x), r1=62(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 145
LDI r1, 62
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a blue line segment connecting (76, 213) to (221, 74).
; PLAN: r0=76(x1), r1=213(y1), r2=221(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 213
LDI r2, 221
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
