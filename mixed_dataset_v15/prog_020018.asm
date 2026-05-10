; DESCRIPTION: Renders a yellow box of size 67x92 starting at (129, 113).
; PLAN: r0=129(x), r1=113(y), r2=67(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 113
LDI r2, 67
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
