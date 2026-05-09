; DESCRIPTION: Places a white 67x23 rectangle at position (35, 124).
; PLAN: r0=35(x), r1=124(y), r2=67(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 124
LDI r2, 67
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
