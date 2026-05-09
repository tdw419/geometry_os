; DESCRIPTION: Places a white 62x63 rectangle at position (343, 22).
; PLAN: r0=343(x), r1=22(y), r2=62(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 22
LDI r2, 62
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
