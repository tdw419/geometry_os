; DESCRIPTION: Composite: . Then Places a red line segment connecting (207, 249) to (62, 58). Then Places a magenta dot at position (120, 9).
; PLAN: r0=207(x1), r1=249(y1), r2=62(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=120(x), r1=9(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (207, 249) to (62, 58).
; PLAN: r0=207(x1), r1=249(y1), r2=62(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 249
LDI r2, 62
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (120, 9).
; PLAN: r0=120(x), r1=9(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 9
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
