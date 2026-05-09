; DESCRIPTION: Renders a magenta box of size 32x24 starting at (33, 133).
; PLAN: r0=33(x), r1=133(y), r2=32(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 133
LDI r2, 32
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
