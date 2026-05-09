; DESCRIPTION: Renders a yellow box of size 111x59 starting at (122, 30).
; PLAN: r0=122(x), r1=30(y), r2=111(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 30
LDI r2, 111
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
