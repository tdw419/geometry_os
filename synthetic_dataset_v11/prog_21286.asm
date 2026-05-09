; DESCRIPTION: Composite: . Then Places a orange dot at position (75, 39). Then Creates a cyan circular shape at (138, 186) with radius 66.
; PLAN: r0=75(x), r1=39(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=138(x), r1=186(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (75, 39).
; PLAN: r0=75(x), r1=39(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 39
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan circular shape at (138, 186) with radius 66.
; PLAN: r0=138(x), r1=186(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 186
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
