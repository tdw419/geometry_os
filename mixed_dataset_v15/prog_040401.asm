; DESCRIPTION: Renders a magenta box of size 93x78 starting at (368, 165).
; PLAN: r0=368(x), r1=165(y), r2=93(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 165
LDI r2, 93
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
