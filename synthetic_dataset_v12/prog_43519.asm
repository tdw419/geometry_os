; DESCRIPTION: Places a white 88x89 rectangle at position (380, 101).
; PLAN: r0=380(x), r1=101(y), r2=88(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 101
LDI r2, 88
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
