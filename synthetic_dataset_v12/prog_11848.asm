; DESCRIPTION: Renders a magenta box of size 87x116 starting at (247, 85).
; PLAN: r0=247(x), r1=85(y), r2=87(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 85
LDI r2, 87
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
