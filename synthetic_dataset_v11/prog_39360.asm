; DESCRIPTION: Composite: . Then Renders a black box of size 81x94 starting at (76, 0). Then Sets a single orange pixel at (166, 186).
; PLAN: r0=76(x), r1=0(y), r2=81(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=166(x), r1=186(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black box of size 81x94 starting at (76, 0).
; PLAN: r0=76(x), r1=0(y), r2=81(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 0
LDI r2, 81
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (166, 186).
; PLAN: r0=166(x), r1=186(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 186
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
