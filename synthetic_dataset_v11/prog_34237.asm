; DESCRIPTION: Composite: . Then Draws a blue circle centered at (150, 86) with radius 74. Then Places a white dot at position (214, 173).
; PLAN: r0=150(x), r1=86(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=214(x), r1=173(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue circle centered at (150, 86) with radius 74.
; PLAN: r0=150(x), r1=86(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 86
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (214, 173).
; PLAN: r0=214(x), r1=173(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 173
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
