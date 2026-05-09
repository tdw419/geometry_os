; DESCRIPTION: Renders a magenta box of size 60x63 starting at (228, 3).
; PLAN: r0=228(x), r1=3(y), r2=60(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 3
LDI r2, 60
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
