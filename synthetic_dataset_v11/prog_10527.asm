; DESCRIPTION: Composite: . Then Renders a black disk with center (135, 69) and radius 63. Then Places a cyan dot at position (188, 153).
; PLAN: r0=135(x), r1=69(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=188(x), r1=153(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black disk with center (135, 69) and radius 63.
; PLAN: r0=135(x), r1=69(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 69
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (188, 153).
; PLAN: r0=188(x), r1=153(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 153
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
