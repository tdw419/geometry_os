; DESCRIPTION: Renders a blue box of size 73x120 starting at (402, 8).
; PLAN: r0=402(x), r1=8(y), r2=73(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 8
LDI r2, 73
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
