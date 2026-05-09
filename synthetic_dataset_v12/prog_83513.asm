; DESCRIPTION: Renders a yellow box of size 34x92 starting at (307, 155).
; PLAN: r0=307(x), r1=155(y), r2=34(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 155
LDI r2, 34
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
