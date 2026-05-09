; DESCRIPTION: Renders a magenta box of size 107x85 starting at (84, 143).
; PLAN: r0=84(x), r1=143(y), r2=107(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 143
LDI r2, 107
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
