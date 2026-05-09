; DESCRIPTION: Renders a magenta box of size 87x65 starting at (246, 78).
; PLAN: r0=246(x), r1=78(y), r2=87(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 78
LDI r2, 87
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
