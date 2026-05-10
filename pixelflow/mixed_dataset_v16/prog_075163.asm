; DESCRIPTION: Renders a blue box of size 77x42 starting at (99, 109).
; PLAN: r0=99(x), r1=109(y), r2=77(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 109
LDI r2, 77
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
