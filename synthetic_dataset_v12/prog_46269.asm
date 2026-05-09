; DESCRIPTION: Renders a magenta box of size 86x107 starting at (325, 85).
; PLAN: r0=325(x), r1=85(y), r2=86(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 85
LDI r2, 86
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
