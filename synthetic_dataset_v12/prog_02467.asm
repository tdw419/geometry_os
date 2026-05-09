; DESCRIPTION: Places a white 45x67 rectangle at position (108, 14).
; PLAN: r0=108(x), r1=14(y), r2=45(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 14
LDI r2, 45
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
