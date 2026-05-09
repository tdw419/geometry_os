; DESCRIPTION: Renders a magenta box of size 52x58 starting at (31, 50).
; PLAN: r0=31(x), r1=50(y), r2=52(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 50
LDI r2, 52
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
