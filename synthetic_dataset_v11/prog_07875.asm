; DESCRIPTION: Renders a blue box of size 33x99 starting at (62, 42).
; PLAN: r0=62(x), r1=42(y), r2=33(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 42
LDI r2, 33
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
