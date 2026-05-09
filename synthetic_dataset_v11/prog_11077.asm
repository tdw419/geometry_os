; DESCRIPTION: Composite: . Then Draws a blue circle centered at (175, 156) with radius 59. Then Places a cyan dot at position (150, 140).
; PLAN: r0=175(x), r1=156(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=150(x), r1=140(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue circle centered at (175, 156) with radius 59.
; PLAN: r0=175(x), r1=156(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 156
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (150, 140).
; PLAN: r0=150(x), r1=140(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 140
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
