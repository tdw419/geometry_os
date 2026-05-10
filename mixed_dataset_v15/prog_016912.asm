; DESCRIPTION: Places a white 19x19 rectangle at position (318, 128).
; PLAN: r0=318(x), r1=128(y), r2=19(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 128
LDI r2, 19
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
