; DESCRIPTION: Places a white 32x41 rectangle at position (155, 204).
; PLAN: r0=155(x), r1=204(y), r2=32(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 204
LDI r2, 32
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
