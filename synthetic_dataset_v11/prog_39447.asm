; DESCRIPTION: Composite: . Then Places a magenta dot at position (64, 102). Then Places a yellow line segment connecting (194, 185) to (134, 246).
; PLAN: r0=64(x), r1=102(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=194(x1), r1=185(y1), r2=134(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (64, 102).
; PLAN: r0=64(x), r1=102(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 64
LDI r1, 102
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a yellow line segment connecting (194, 185) to (134, 246).
; PLAN: r0=194(x1), r1=185(y1), r2=134(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 185
LDI r2, 134
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
