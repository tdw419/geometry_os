; DESCRIPTION: Composite: . Then Places a orange dot at position (204, 72). Then Creates a yellow rectangular region at (67, 114) spanning 15 by 35 pixels.
; PLAN: r0=204(x), r1=72(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=67(x), r1=114(y), r2=15(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (204, 72).
; PLAN: r0=204(x), r1=72(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 72
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (67, 114) spanning 15 by 35 pixels.
; PLAN: r0=67(x), r1=114(y), r2=15(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 114
LDI r2, 15
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
