; DESCRIPTION: Renders a magenta box of size 42x103 starting at (232, 20).
; PLAN: r0=232(x), r1=20(y), r2=42(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 20
LDI r2, 42
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
