; DESCRIPTION: Places a white 105x73 rectangle at position (19, 170).
; PLAN: r0=19(x), r1=170(y), r2=105(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 170
LDI r2, 105
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
