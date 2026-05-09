; DESCRIPTION: Renders a blue box of size 79x64 starting at (93, 144).
; PLAN: r0=93(x), r1=144(y), r2=79(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 144
LDI r2, 79
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
