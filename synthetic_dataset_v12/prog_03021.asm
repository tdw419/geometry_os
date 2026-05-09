; DESCRIPTION: Places a white 84x104 rectangle at position (93, 30).
; PLAN: r0=93(x), r1=30(y), r2=84(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 30
LDI r2, 84
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
