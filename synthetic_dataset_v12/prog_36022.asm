; DESCRIPTION: Renders a magenta box of size 78x45 starting at (63, 96).
; PLAN: r0=63(x), r1=96(y), r2=78(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 96
LDI r2, 78
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
