; DESCRIPTION: Renders a yellow box of size 63x89 starting at (140, 32).
; PLAN: r0=140(x), r1=32(y), r2=63(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 32
LDI r2, 63
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
