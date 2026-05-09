; DESCRIPTION: Renders a black box of size 102x67 starting at (103, 13).
; PLAN: r0=103(x), r1=13(y), r2=102(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 13
LDI r2, 102
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
