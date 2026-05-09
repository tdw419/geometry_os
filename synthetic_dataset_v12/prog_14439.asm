; DESCRIPTION: Places a white 62x10 rectangle at position (31, 149).
; PLAN: r0=31(x), r1=149(y), r2=62(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 149
LDI r2, 62
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
