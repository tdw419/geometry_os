; DESCRIPTION: Composite: . Then Renders a cyan box of size 29x21 starting at (78, 74). Then Places a orange dot at position (102, 67).
; PLAN: r0=78(x), r1=74(y), r2=29(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=102(x), r1=67(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 29x21 starting at (78, 74).
; PLAN: r0=78(x), r1=74(y), r2=29(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 74
LDI r2, 29
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (102, 67).
; PLAN: r0=102(x), r1=67(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 67
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
