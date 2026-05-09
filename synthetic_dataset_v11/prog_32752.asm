; DESCRIPTION: Composite: . Then Draws a blue circle centered at (136, 193) with radius 16. Then Places a cyan dot at position (205, 249).
; PLAN: r0=136(x), r1=193(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=205(x), r1=249(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue circle centered at (136, 193) with radius 16.
; PLAN: r0=136(x), r1=193(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 193
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (205, 249).
; PLAN: r0=205(x), r1=249(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 249
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
