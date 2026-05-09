; DESCRIPTION: Places a white 62x100 rectangle at position (53, 90).
; PLAN: r0=53(x), r1=90(y), r2=62(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 90
LDI r2, 62
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
