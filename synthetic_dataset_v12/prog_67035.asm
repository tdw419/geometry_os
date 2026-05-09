; DESCRIPTION: Renders a magenta box of size 103x75 starting at (140, 108).
; PLAN: r0=140(x), r1=108(y), r2=103(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 108
LDI r2, 103
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
