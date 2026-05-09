; DESCRIPTION: Renders a magenta box of size 42x32 starting at (12, 155).
; PLAN: r0=12(x), r1=155(y), r2=42(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 155
LDI r2, 42
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
