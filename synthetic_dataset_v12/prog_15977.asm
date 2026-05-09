; DESCRIPTION: Renders a magenta box of size 60x111 starting at (450, 97).
; PLAN: r0=450(x), r1=97(y), r2=60(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 97
LDI r2, 60
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
