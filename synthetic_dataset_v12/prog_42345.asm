; DESCRIPTION: Places a white 76x49 rectangle at position (361, 71).
; PLAN: r0=361(x), r1=71(y), r2=76(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 71
LDI r2, 76
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
