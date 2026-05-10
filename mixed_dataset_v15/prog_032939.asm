; DESCRIPTION: Renders a magenta rectangular region spanning 63 by 115 at (17, 42).
; PLAN: r0=17(x), r1=42(y), r2=63(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 42
LDI r2, 63
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
