; DESCRIPTION: Renders a magenta box of size 62x45 starting at (264, 10).
; PLAN: r0=264(x), r1=10(y), r2=62(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 10
LDI r2, 62
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
