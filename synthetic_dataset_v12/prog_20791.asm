; DESCRIPTION: Renders a magenta box of size 43x101 starting at (324, 146).
; PLAN: r0=324(x), r1=146(y), r2=43(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 146
LDI r2, 43
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
