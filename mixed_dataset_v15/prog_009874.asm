; DESCRIPTION: Renders a white box of size 114x111 starting at (59, 0).
; PLAN: r0=59(x), r1=0(y), r2=114(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 0
LDI r2, 114
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
