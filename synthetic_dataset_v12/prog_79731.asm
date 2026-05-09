; DESCRIPTION: Renders a yellow box of size 10x60 starting at (460, 136).
; PLAN: r0=460(x), r1=136(y), r2=10(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 136
LDI r2, 10
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
