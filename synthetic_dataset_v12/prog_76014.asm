; DESCRIPTION: Places a white 70x67 rectangle at position (233, 39).
; PLAN: r0=233(x), r1=39(y), r2=70(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 39
LDI r2, 70
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
