; DESCRIPTION: Places a white 43x98 rectangle at position (128, 75).
; PLAN: r0=128(x), r1=75(y), r2=43(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 75
LDI r2, 43
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
