; DESCRIPTION: Renders a purple box of size 42x37 starting at (376, 163).
; PLAN: r0=376(x), r1=163(y), r2=42(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 163
LDI r2, 42
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
