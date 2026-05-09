; DESCRIPTION: Renders a magenta box of size 116x87 starting at (26, 73).
; PLAN: r0=26(x), r1=73(y), r2=116(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 73
LDI r2, 116
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
