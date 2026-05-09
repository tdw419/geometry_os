; DESCRIPTION: Renders a magenta box of size 12x100 starting at (82, 126).
; PLAN: r0=82(x), r1=126(y), r2=12(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 126
LDI r2, 12
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
