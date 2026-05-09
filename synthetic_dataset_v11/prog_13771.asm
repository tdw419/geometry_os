; DESCRIPTION: Renders a yellow box of size 67x92 starting at (183, 148).
; PLAN: r0=183(x), r1=148(y), r2=67(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 148
LDI r2, 67
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
