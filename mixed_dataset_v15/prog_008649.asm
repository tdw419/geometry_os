; DESCRIPTION: Renders a magenta box of size 93x65 starting at (278, 138).
; PLAN: r0=278(x), r1=138(y), r2=93(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 138
LDI r2, 93
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
