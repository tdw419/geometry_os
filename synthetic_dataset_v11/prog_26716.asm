; DESCRIPTION: Renders a green box of size 68x111 starting at (64, 136).
; PLAN: r0=64(x), r1=136(y), r2=68(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 136
LDI r2, 68
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
