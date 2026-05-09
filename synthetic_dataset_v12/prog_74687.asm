; DESCRIPTION: Places a white 67x98 rectangle at position (34, 39).
; PLAN: r0=34(x), r1=39(y), r2=67(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 39
LDI r2, 67
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
