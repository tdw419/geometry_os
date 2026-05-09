; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (94, 178) with radius 64. Then Places a orange dot at position (106, 158).
; PLAN: r0=94(x), r1=178(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=106(x), r1=158(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan circular shape at (94, 178) with radius 64.
; PLAN: r0=94(x), r1=178(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 178
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (106, 158).
; PLAN: r0=106(x), r1=158(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 158
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
