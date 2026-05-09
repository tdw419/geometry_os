; DESCRIPTION: Renders a yellow box of size 97x59 starting at (246, 59).
; PLAN: r0=246(x), r1=59(y), r2=97(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 59
LDI r2, 97
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
