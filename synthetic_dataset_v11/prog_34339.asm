; DESCRIPTION: Renders a magenta box of size 53x59 starting at (170, 170).
; PLAN: r0=170(x), r1=170(y), r2=53(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 170
LDI r2, 53
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
