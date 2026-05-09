; DESCRIPTION: Places a magenta 11x102 rectangle at position (23, 140).
; PLAN: r0=23(x), r1=140(y), r2=11(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 140
LDI r2, 11
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
