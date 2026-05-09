; DESCRIPTION: Renders a magenta box of size 102x25 starting at (312, 126).
; PLAN: r0=312(x), r1=126(y), r2=102(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 126
LDI r2, 102
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
