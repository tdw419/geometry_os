; DESCRIPTION: Renders a white box of size 67x36 starting at (309, 131).
; PLAN: r0=309(x), r1=131(y), r2=67(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 131
LDI r2, 67
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
