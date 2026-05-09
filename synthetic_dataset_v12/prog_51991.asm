; DESCRIPTION: Renders a magenta box of size 93x75 starting at (261, 108).
; PLAN: r0=261(x), r1=108(y), r2=93(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 108
LDI r2, 93
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
