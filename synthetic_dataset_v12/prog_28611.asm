; DESCRIPTION: Renders a purple box of size 78x68 starting at (414, 93).
; PLAN: r0=414(x), r1=93(y), r2=78(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 93
LDI r2, 78
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
