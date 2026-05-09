; DESCRIPTION: Renders a blue box of size 60x110 starting at (42, 34).
; PLAN: r0=42(x), r1=34(y), r2=60(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 34
LDI r2, 60
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
