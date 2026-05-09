; DESCRIPTION: Renders a purple box of size 86x111 starting at (164, 136).
; PLAN: r0=164(x), r1=136(y), r2=86(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 136
LDI r2, 86
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
