; DESCRIPTION: Composite: . Then Places a white 10x27 rectangle at position (88, 37). Then Sets a single orange pixel at (163, 65).
; PLAN: r0=88(x), r1=37(y), r2=10(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=163(x), r1=65(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white 10x27 rectangle at position (88, 37).
; PLAN: r0=88(x), r1=37(y), r2=10(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 37
LDI r2, 10
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (163, 65).
; PLAN: r0=163(x), r1=65(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 65
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
