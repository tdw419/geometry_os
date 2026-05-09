; DESCRIPTION: Renders a green box of size 67x75 starting at (88, 103).
; PLAN: r0=88(x), r1=103(y), r2=67(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 103
LDI r2, 67
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
