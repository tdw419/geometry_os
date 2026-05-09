; DESCRIPTION: Renders a yellow box of size 108x92 starting at (172, 114).
; PLAN: r0=172(x), r1=114(y), r2=108(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 114
LDI r2, 108
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
