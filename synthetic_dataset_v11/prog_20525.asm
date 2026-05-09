; DESCRIPTION: Renders a yellow box of size 40x63 starting at (61, 10).
; PLAN: r0=61(x), r1=10(y), r2=40(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 10
LDI r2, 40
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
