; DESCRIPTION: Creates a cyan filled rectangle of size 69x63 starting at (341, 87).
; PLAN: r0=341(x), r1=87(y), r2=69(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 87
LDI r2, 69
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
