; DESCRIPTION: Places a cyan 43x105 rectangle at position (183, 61).
; PLAN: r0=183(x), r1=61(y), r2=43(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 61
LDI r2, 43
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
