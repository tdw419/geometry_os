; DESCRIPTION: Renders a yellow rectangular region spanning 111 by 67 at (99, 163).
; PLAN: r0=99(x), r1=163(y), r2=111(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 163
LDI r2, 111
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
