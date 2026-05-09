; DESCRIPTION: Places a white 34x67 rectangle at position (306, 145).
; PLAN: r0=306(x), r1=145(y), r2=34(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 145
LDI r2, 34
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
