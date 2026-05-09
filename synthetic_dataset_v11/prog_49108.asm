; DESCRIPTION: Composite: . Then Draws a blue circle centered at (75, 141) with radius 61. Then Places a green dot at position (154, 93).
; PLAN: r0=75(x), r1=141(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=154(x), r1=93(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue circle centered at (75, 141) with radius 61.
; PLAN: r0=75(x), r1=141(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 141
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (154, 93).
; PLAN: r0=154(x), r1=93(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 93
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
