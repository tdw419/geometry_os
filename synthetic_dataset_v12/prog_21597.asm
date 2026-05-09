; DESCRIPTION: Places a red 67x89 rectangle at position (436, 130).
; PLAN: r0=436(x), r1=130(y), r2=67(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 130
LDI r2, 67
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
