; DESCRIPTION: Renders a blue box of size 42x80 starting at (318, 148).
; PLAN: r0=318(x), r1=148(y), r2=42(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 148
LDI r2, 42
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
