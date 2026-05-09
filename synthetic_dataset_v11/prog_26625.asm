; DESCRIPTION: Composite: . Then Places a orange dot at position (16, 43). Then Draws a cyan circle centered at (109, 96) with radius 77.
; PLAN: r0=16(x), r1=43(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=109(x), r1=96(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (16, 43).
; PLAN: r0=16(x), r1=43(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 43
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan circle centered at (109, 96) with radius 77.
; PLAN: r0=109(x), r1=96(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 96
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
