; DESCRIPTION: Places a white 16x97 rectangle at position (41, 3).
; PLAN: r0=41(x), r1=3(y), r2=16(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 3
LDI r2, 16
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
