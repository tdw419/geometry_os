; DESCRIPTION: Places a white 41x31 rectangle at position (203, 105).
; PLAN: r0=203(x), r1=105(y), r2=41(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 105
LDI r2, 41
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
