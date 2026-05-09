; DESCRIPTION: Places a white 76x117 rectangle at position (163, 122).
; PLAN: r0=163(x), r1=122(y), r2=76(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 122
LDI r2, 76
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
