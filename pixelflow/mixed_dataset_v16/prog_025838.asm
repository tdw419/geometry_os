; DESCRIPTION: Renders a magenta rectangular region spanning 42 by 114 at (101, 8).
; PLAN: r0=101(x), r1=8(y), r2=42(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 8
LDI r2, 42
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
