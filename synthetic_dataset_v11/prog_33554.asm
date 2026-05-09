; DESCRIPTION: Renders a blue box of size 42x89 starting at (205, 48).
; PLAN: r0=205(x), r1=48(y), r2=42(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 48
LDI r2, 42
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
