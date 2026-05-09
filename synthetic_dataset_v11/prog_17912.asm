; DESCRIPTION: Places a white 35x19 rectangle at position (78, 5).
; PLAN: r0=78(x), r1=5(y), r2=35(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 5
LDI r2, 35
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
