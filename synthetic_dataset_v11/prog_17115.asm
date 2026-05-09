; DESCRIPTION: Renders a magenta box of size 106x104 starting at (131, 43).
; PLAN: r0=131(x), r1=43(y), r2=106(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 43
LDI r2, 106
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
