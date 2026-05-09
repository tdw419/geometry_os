; DESCRIPTION: Renders a magenta box of size 45x49 starting at (321, 126).
; PLAN: r0=321(x), r1=126(y), r2=45(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 126
LDI r2, 45
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
