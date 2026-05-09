; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (93, 79) to (77, 142). Then Draws a black circle centered at (166, 114) with radius 16.
; PLAN: r0=93(x1), r1=79(y1), r2=77(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=166(x), r1=114(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan line segment connecting (93, 79) to (77, 142).
; PLAN: r0=93(x1), r1=79(y1), r2=77(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 79
LDI r2, 77
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (166, 114) with radius 16.
; PLAN: r0=166(x), r1=114(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 114
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
