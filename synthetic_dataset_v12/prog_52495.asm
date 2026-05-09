; DESCRIPTION: Renders a black box of size 72x111 starting at (256, 105).
; PLAN: r0=256(x), r1=105(y), r2=72(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 105
LDI r2, 72
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
