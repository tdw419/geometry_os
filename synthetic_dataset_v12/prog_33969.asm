; DESCRIPTION: Renders a blue box of size 63x82 starting at (74, 120).
; PLAN: r0=74(x), r1=120(y), r2=63(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 120
LDI r2, 63
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
