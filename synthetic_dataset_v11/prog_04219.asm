; DESCRIPTION: Places a white 18x74 rectangle at position (76, 25).
; PLAN: r0=76(x), r1=25(y), r2=18(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 25
LDI r2, 18
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
