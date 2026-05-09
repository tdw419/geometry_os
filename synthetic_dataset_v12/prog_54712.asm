; DESCRIPTION: Renders a magenta box of size 96x53 starting at (28, 199).
; PLAN: r0=28(x), r1=199(y), r2=96(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 199
LDI r2, 96
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
