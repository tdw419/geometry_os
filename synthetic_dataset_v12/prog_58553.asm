; DESCRIPTION: Renders a white box of size 67x28 starting at (419, 184).
; PLAN: r0=419(x), r1=184(y), r2=67(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 184
LDI r2, 67
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
