; DESCRIPTION: Renders a blue box of size 103x62 starting at (52, 96).
; PLAN: r0=52(x), r1=96(y), r2=103(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 96
LDI r2, 103
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
