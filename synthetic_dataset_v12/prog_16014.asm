; DESCRIPTION: Renders a magenta box of size 32x12 starting at (381, 34).
; PLAN: r0=381(x), r1=34(y), r2=32(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 34
LDI r2, 32
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
