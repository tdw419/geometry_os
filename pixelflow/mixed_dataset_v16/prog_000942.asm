; DESCRIPTION: Renders a cyan box of size 114x114 starting at (172, 103).
; PLAN: r0=172(x), r1=103(y), r2=114(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 103
LDI r2, 114
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
