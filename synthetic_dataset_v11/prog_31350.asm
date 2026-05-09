; DESCRIPTION: Renders a green box of size 34x22 starting at (67, 131).
; PLAN: r0=67(x), r1=131(y), r2=34(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 131
LDI r2, 34
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
