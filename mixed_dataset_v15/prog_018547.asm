; DESCRIPTION: Renders a purple box of size 95x53 starting at (339, 156).
; PLAN: r0=339(x), r1=156(y), r2=95(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 156
LDI r2, 95
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
