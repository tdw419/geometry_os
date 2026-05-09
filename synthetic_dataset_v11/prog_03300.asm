; DESCRIPTION: Places a white 67x17 rectangle at position (181, 112).
; PLAN: r0=181(x), r1=112(y), r2=67(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 112
LDI r2, 67
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
