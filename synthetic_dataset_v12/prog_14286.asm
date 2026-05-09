; DESCRIPTION: Renders a magenta box of size 70x105 starting at (3, 102).
; PLAN: r0=3(x), r1=102(y), r2=70(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 102
LDI r2, 70
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
