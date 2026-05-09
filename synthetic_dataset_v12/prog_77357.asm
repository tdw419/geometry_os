; DESCRIPTION: Places a white 64x13 rectangle at position (107, 214).
; PLAN: r0=107(x), r1=214(y), r2=64(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 214
LDI r2, 64
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
