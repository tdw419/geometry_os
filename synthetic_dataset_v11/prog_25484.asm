; DESCRIPTION: Renders a magenta box of size 12x105 starting at (7, 131).
; PLAN: r0=7(x), r1=131(y), r2=12(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 131
LDI r2, 12
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
