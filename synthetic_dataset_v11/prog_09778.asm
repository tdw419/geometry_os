; DESCRIPTION: Composite: . Then Places a red dot at position (67, 245). Then Renders a green box of size 42x114 starting at (3, 99).
; PLAN: r0=67(x), r1=245(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=3(x), r1=99(y), r2=42(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (67, 245).
; PLAN: r0=67(x), r1=245(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 245
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 42x114 starting at (3, 99).
; PLAN: r0=3(x), r1=99(y), r2=42(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 99
LDI r2, 42
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
