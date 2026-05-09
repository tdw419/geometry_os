; DESCRIPTION: Renders a magenta box of size 60x28 starting at (290, 138).
; PLAN: r0=290(x), r1=138(y), r2=60(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 138
LDI r2, 60
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
