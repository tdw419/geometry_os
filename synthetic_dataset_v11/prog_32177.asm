; DESCRIPTION: Composite: . Then Places a white dot at position (25, 164). Then Draws a green circle centered at (44, 96) with radius 40.
; PLAN: r0=25(x), r1=164(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=44(x), r1=96(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (25, 164).
; PLAN: r0=25(x), r1=164(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 164
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a green circle centered at (44, 96) with radius 40.
; PLAN: r0=44(x), r1=96(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 96
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
