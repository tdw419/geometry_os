; DESCRIPTION: Renders a magenta box of size 98x23 starting at (82, 105).
; PLAN: r0=82(x), r1=105(y), r2=98(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 105
LDI r2, 98
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
