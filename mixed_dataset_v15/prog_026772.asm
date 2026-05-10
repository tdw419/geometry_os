; DESCRIPTION: Renders a yellow box of size 18x71 starting at (48, 67).
; PLAN: r0=48(x), r1=67(y), r2=18(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 67
LDI r2, 18
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
