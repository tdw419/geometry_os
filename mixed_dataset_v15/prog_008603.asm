; DESCRIPTION: Renders a magenta box of size 53x56 starting at (236, 1).
; PLAN: r0=236(x), r1=1(y), r2=53(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 1
LDI r2, 53
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
