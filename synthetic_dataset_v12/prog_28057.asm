; DESCRIPTION: Places a white 68x100 rectangle at position (134, 104).
; PLAN: r0=134(x), r1=104(y), r2=68(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 104
LDI r2, 68
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
