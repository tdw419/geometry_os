; DESCRIPTION: Places a white 11x67 rectangle at position (226, 29).
; PLAN: r0=226(x), r1=29(y), r2=11(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 29
LDI r2, 11
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
