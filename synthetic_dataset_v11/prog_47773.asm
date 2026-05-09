; DESCRIPTION: Places a white 53x77 rectangle at position (101, 24).
; PLAN: r0=101(x), r1=24(y), r2=53(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 24
LDI r2, 53
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
