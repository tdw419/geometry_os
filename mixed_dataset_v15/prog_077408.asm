; DESCRIPTION: Renders a blue box of size 96x64 starting at (168, 24).
; PLAN: r0=168(x), r1=24(y), r2=96(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 24
LDI r2, 96
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
