; DESCRIPTION: Places a white 16x61 rectangle at position (432, 49).
; PLAN: r0=432(x), r1=49(y), r2=16(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 49
LDI r2, 16
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
