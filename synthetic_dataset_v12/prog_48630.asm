; DESCRIPTION: Renders a blue box of size 25x24 starting at (10, 14).
; PLAN: r0=10(x), r1=14(y), r2=25(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 14
LDI r2, 25
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
