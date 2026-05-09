; DESCRIPTION: Renders a yellow box of size 64x96 starting at (362, 80).
; PLAN: r0=362(x), r1=80(y), r2=64(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 80
LDI r2, 64
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
