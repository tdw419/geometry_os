; DESCRIPTION: Renders a blue box of size 95x60 starting at (129, 7).
; PLAN: r0=129(x), r1=7(y), r2=95(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 7
LDI r2, 95
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
