; DESCRIPTION: Places a white 67x83 rectangle at position (152, 14).
; PLAN: r0=152(x), r1=14(y), r2=67(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 14
LDI r2, 67
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
