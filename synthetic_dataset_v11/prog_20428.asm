; DESCRIPTION: Composite: . Then Places a yellow dot at position (67, 226). Then Places a green line segment connecting (153, 123) to (30, 43).
; PLAN: r0=67(x), r1=226(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=153(x1), r1=123(y1), r2=30(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (67, 226).
; PLAN: r0=67(x), r1=226(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 226
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a green line segment connecting (153, 123) to (30, 43).
; PLAN: r0=153(x1), r1=123(y1), r2=30(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 123
LDI r2, 30
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
