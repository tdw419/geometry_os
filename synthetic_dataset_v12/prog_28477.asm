; DESCRIPTION: Places a white 98x105 rectangle at position (316, 128).
; PLAN: r0=316(x), r1=128(y), r2=98(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 128
LDI r2, 98
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
