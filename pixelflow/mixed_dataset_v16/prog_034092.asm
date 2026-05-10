; DESCRIPTION: Renders a magenta box of size 82x106 starting at (126, 82).
; PLAN: r0=126(x), r1=82(y), r2=82(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 82
LDI r2, 82
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
