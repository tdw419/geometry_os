; DESCRIPTION: Creates a blue filled rectangle of size 66x82 starting at (157, 85).
; PLAN: r0=157(x), r1=85(y), r2=66(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 85
LDI r2, 66
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
