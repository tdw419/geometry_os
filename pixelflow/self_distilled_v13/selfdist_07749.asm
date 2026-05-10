; DESCRIPTION: Renders a blue rectangular region spanning 93 by 42 at (95, 88).
; PLAN: r0=95(x), r1=88(y), r2=93(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 88
LDI r2, 93
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
