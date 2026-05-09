; DESCRIPTION: Renders a cyan box of size 114x78 starting at (134, 158).
; PLAN: r0=134(x), r1=158(y), r2=114(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 158
LDI r2, 114
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
