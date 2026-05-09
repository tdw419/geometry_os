; DESCRIPTION: Renders a yellow box of size 63x28 starting at (358, 16).
; PLAN: r0=358(x), r1=16(y), r2=63(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 16
LDI r2, 63
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
