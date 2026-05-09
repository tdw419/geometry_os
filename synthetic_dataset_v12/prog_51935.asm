; DESCRIPTION: Places a white 67x61 rectangle at position (88, 174).
; PLAN: r0=88(x), r1=174(y), r2=67(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 174
LDI r2, 67
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
