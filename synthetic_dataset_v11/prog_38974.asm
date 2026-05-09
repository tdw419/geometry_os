; DESCRIPTION: Composite: . Then Places a white dot at position (243, 28). Then Draws a blue circle centered at (105, 57) with radius 49.
; PLAN: r0=243(x), r1=28(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=105(x), r1=57(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (243, 28).
; PLAN: r0=243(x), r1=28(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 243
LDI r1, 28
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue circle centered at (105, 57) with radius 49.
; PLAN: r0=105(x), r1=57(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 57
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
