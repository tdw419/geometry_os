; DESCRIPTION: Renders a black box of size 67x81 starting at (410, 53).
; PLAN: r0=410(x), r1=53(y), r2=67(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 53
LDI r2, 67
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
