; DESCRIPTION: Composite: . Then Draws a cyan line from (97, 241) to (85, 60). Then Renders a black disk with center (49, 63) and radius 45.
; PLAN: r0=97(x1), r1=241(y1), r2=85(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=49(x), r1=63(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (97, 241) to (85, 60).
; PLAN: r0=97(x1), r1=241(y1), r2=85(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 241
LDI r2, 85
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (49, 63) and radius 45.
; PLAN: r0=49(x), r1=63(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 63
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
