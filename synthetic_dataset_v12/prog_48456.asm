; DESCRIPTION: Renders a magenta box of size 56x14 starting at (414, 125).
; PLAN: r0=414(x), r1=125(y), r2=56(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 125
LDI r2, 56
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
