; DESCRIPTION: Renders a magenta box of size 34x14 starting at (221, 53).
; PLAN: r0=221(x), r1=53(y), r2=34(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 53
LDI r2, 34
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
