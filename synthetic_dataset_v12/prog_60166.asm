; DESCRIPTION: Places a white 86x13 rectangle at position (17, 115).
; PLAN: r0=17(x), r1=115(y), r2=86(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 115
LDI r2, 86
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
