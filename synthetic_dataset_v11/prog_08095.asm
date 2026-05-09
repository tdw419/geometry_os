; DESCRIPTION: Renders a magenta box of size 98x65 starting at (140, 159).
; PLAN: r0=140(x), r1=159(y), r2=98(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 159
LDI r2, 98
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
