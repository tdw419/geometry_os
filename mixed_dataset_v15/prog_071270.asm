; DESCRIPTION: Renders a magenta box of size 83x92 starting at (259, 72).
; PLAN: r0=259(x), r1=72(y), r2=83(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 72
LDI r2, 83
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
