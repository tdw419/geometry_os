; DESCRIPTION: Places a white 72x12 rectangle at position (12, 155).
; PLAN: r0=12(x), r1=155(y), r2=72(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 155
LDI r2, 72
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
