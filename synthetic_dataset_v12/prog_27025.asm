; DESCRIPTION: Places a white 67x62 rectangle at position (167, 14).
; PLAN: r0=167(x), r1=14(y), r2=67(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 14
LDI r2, 67
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
