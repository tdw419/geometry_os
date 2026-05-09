; DESCRIPTION: Renders a magenta box of size 84x108 starting at (361, 6).
; PLAN: r0=361(x), r1=6(y), r2=84(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 6
LDI r2, 84
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
