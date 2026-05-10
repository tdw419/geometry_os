; DESCRIPTION: Creates a green filled rectangle of size 113x85 starting at (381, 11).
; PLAN: r0=381(x), r1=11(y), r2=113(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 11
LDI r2, 113
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
