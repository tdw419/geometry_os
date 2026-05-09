; DESCRIPTION: Renders a magenta box of size 60x80 starting at (65, 47).
; PLAN: r0=65(x), r1=47(y), r2=60(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 47
LDI r2, 60
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
