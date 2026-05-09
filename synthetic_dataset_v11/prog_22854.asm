; DESCRIPTION: Places a white 67x10 rectangle at position (143, 105).
; PLAN: r0=143(x), r1=105(y), r2=67(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 105
LDI r2, 67
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
