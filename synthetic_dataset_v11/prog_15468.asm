; DESCRIPTION: Composite: . Then Places a black line segment connecting (231, 50) to (51, 0). Then Places a magenta dot at position (95, 102).
; PLAN: r0=231(x1), r1=50(y1), r2=51(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=95(x), r1=102(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (231, 50) to (51, 0).
; PLAN: r0=231(x1), r1=50(y1), r2=51(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 50
LDI r2, 51
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (95, 102).
; PLAN: r0=95(x), r1=102(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 102
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
