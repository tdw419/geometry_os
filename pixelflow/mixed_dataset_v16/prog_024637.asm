; DESCRIPTION: Creates a white filled rectangle of size 69x28 starting at (330, 71).
; PLAN: r0=330(x), r1=71(y), r2=69(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 71
LDI r2, 69
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
