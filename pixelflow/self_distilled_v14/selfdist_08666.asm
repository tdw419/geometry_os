; DESCRIPTION: Creates a white filled rectangle of size 69x25 starting at (85, 3).
; PLAN: r0=85(x), r1=3(y), r2=69(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 3
LDI r2, 69
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
