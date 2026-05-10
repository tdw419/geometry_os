; DESCRIPTION: Places a white 26x89 rectangle at position (375, 125).
; PLAN: r0=375(x), r1=125(y), r2=26(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 125
LDI r2, 26
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
