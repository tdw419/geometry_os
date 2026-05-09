; DESCRIPTION: Places a black 55x67 rectangle at position (138, 135).
; PLAN: r0=138(x), r1=135(y), r2=55(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 135
LDI r2, 55
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
