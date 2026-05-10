; DESCRIPTION: Places a white 53x12 rectangle at position (252, 25).
; PLAN: r0=252(x), r1=25(y), r2=53(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 25
LDI r2, 53
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
