; DESCRIPTION: Renders a blue box of size 64x82 starting at (164, 65).
; PLAN: r0=164(x), r1=65(y), r2=64(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 65
LDI r2, 64
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
