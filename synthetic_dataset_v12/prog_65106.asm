; DESCRIPTION: Places a white 45x26 rectangle at position (261, 52).
; PLAN: r0=261(x), r1=52(y), r2=45(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 52
LDI r2, 45
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
