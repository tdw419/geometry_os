; DESCRIPTION: Places a magenta 18x108 rectangle at position (167, 109).
; PLAN: r0=167(x), r1=109(y), r2=18(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 109
LDI r2, 18
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
