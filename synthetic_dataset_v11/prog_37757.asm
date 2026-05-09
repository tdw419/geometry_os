; DESCRIPTION: Composite: . Then Renders a black box of size 59x35 starting at (18, 176). Then Sets a single green pixel at (16, 205).
; PLAN: r0=18(x), r1=176(y), r2=59(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=16(x), r1=205(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black box of size 59x35 starting at (18, 176).
; PLAN: r0=18(x), r1=176(y), r2=59(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 176
LDI r2, 59
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (16, 205).
; PLAN: r0=16(x), r1=205(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 205
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
