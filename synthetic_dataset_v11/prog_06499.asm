; DESCRIPTION: Renders a magenta box of size 42x29 starting at (213, 199).
; PLAN: r0=213(x), r1=199(y), r2=42(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 199
LDI r2, 42
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
