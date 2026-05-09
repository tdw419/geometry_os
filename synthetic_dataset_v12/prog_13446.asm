; DESCRIPTION: Renders a magenta box of size 87x105 starting at (27, 49).
; PLAN: r0=27(x), r1=49(y), r2=87(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 49
LDI r2, 87
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
