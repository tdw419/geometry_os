; DESCRIPTION: Renders a blue box of size 109x60 starting at (42, 94).
; PLAN: r0=42(x), r1=94(y), r2=109(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 94
LDI r2, 109
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
