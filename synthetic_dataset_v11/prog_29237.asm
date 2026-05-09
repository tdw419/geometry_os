; DESCRIPTION: Composite: . Then Draws a blue circle centered at (99, 117) with radius 48. Then Places a blue dot at position (82, 42).
; PLAN: r0=99(x), r1=117(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=82(x), r1=42(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue circle centered at (99, 117) with radius 48.
; PLAN: r0=99(x), r1=117(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 117
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue dot at position (82, 42).
; PLAN: r0=82(x), r1=42(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 42
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
