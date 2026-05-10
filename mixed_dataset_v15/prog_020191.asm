; DESCRIPTION: Renders a magenta box of size 107x79 starting at (294, 63).
; PLAN: r0=294(x), r1=63(y), r2=107(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 63
LDI r2, 107
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
