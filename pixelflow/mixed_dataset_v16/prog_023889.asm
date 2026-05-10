; DESCRIPTION: Renders a yellow box of size 11x100 starting at (95, 67).
; PLAN: r0=95(x), r1=67(y), r2=11(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 67
LDI r2, 11
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
