; DESCRIPTION: Renders a magenta box of size 98x37 starting at (129, 96).
; PLAN: r0=129(x), r1=96(y), r2=98(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 96
LDI r2, 98
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
