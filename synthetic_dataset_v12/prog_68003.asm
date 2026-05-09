; DESCRIPTION: Renders a magenta box of size 46x118 starting at (86, 37).
; PLAN: r0=86(x), r1=37(y), r2=46(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 37
LDI r2, 46
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
