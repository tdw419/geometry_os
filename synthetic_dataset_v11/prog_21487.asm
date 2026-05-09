; DESCRIPTION: Composite: . Then Places a red line segment connecting (64, 117) to (66, 153). Then Places a green circle of radius 73 at center (102, 139).
; PLAN: r0=64(x1), r1=117(y1), r2=66(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=102(x), r1=139(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (64, 117) to (66, 153).
; PLAN: r0=64(x1), r1=117(y1), r2=66(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 117
LDI r2, 66
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 73 at center (102, 139).
; PLAN: r0=102(x), r1=139(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 139
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
