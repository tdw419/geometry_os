; DESCRIPTION: Renders a blue box of size 42x93 starting at (32, 90).
; PLAN: r0=32(x), r1=90(y), r2=42(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 90
LDI r2, 42
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
