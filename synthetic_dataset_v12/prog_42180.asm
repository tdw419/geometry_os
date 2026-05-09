; DESCRIPTION: Renders a blue box of size 99x61 starting at (109, 3).
; PLAN: r0=109(x), r1=3(y), r2=99(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 3
LDI r2, 99
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
