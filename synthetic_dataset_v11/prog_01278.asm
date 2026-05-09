; DESCRIPTION: Renders a yellow box of size 63x57 starting at (34, 10).
; PLAN: r0=34(x), r1=10(y), r2=63(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 10
LDI r2, 63
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
