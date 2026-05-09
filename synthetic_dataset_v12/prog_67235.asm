; DESCRIPTION: Renders a blue box of size 42x98 starting at (179, 34).
; PLAN: r0=179(x), r1=34(y), r2=42(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 34
LDI r2, 42
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
