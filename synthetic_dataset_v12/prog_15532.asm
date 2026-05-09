; DESCRIPTION: Renders a white box of size 67x13 starting at (380, 230).
; PLAN: r0=380(x), r1=230(y), r2=67(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 230
LDI r2, 67
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
