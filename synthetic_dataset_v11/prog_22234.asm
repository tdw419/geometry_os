; DESCRIPTION: Renders a magenta box of size 12x102 starting at (104, 85).
; PLAN: r0=104(x), r1=85(y), r2=12(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 85
LDI r2, 12
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
