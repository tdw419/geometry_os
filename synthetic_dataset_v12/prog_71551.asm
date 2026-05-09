; DESCRIPTION: Renders a blue box of size 73x48 starting at (220, 181).
; PLAN: r0=220(x), r1=181(y), r2=73(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 181
LDI r2, 73
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
