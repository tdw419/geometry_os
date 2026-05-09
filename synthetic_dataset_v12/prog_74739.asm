; DESCRIPTION: Renders a blue box of size 60x32 starting at (411, 24).
; PLAN: r0=411(x), r1=24(y), r2=60(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 24
LDI r2, 60
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
