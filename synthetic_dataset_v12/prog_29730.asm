; DESCRIPTION: Renders a yellow box of size 50x15 starting at (318, 67).
; PLAN: r0=318(x), r1=67(y), r2=50(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 67
LDI r2, 50
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
