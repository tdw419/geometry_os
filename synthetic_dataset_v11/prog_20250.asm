; DESCRIPTION: Composite: . Then Places a blue dot at position (154, 211). Then Places a red line segment connecting (53, 177) to (103, 127).
; PLAN: r0=154(x), r1=211(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=53(x1), r1=177(y1), r2=103(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (154, 211).
; PLAN: r0=154(x), r1=211(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 211
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a red line segment connecting (53, 177) to (103, 127).
; PLAN: r0=53(x1), r1=177(y1), r2=103(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 177
LDI r2, 103
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
