; DESCRIPTION: Composite: . Then Places a white dot at position (196, 204). Then Draws a cyan circle centered at (150, 83) with radius 21.
; PLAN: r0=196(x), r1=204(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=150(x), r1=83(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (196, 204).
; PLAN: r0=196(x), r1=204(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 196
LDI r1, 204
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan circle centered at (150, 83) with radius 21.
; PLAN: r0=150(x), r1=83(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 83
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
