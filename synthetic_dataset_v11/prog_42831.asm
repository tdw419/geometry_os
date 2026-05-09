; DESCRIPTION: Composite: . Then Sets a single black pixel at (48, 231). Then Creates a orange circular shape at (187, 170) with radius 62.
; PLAN: r0=48(x), r1=231(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=187(x), r1=170(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (48, 231).
; PLAN: r0=48(x), r1=231(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 48
LDI r1, 231
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a orange circular shape at (187, 170) with radius 62.
; PLAN: r0=187(x), r1=170(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 170
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
