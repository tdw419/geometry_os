; DESCRIPTION: Renders a yellow box of size 88x63 starting at (267, 56).
; PLAN: r0=267(x), r1=56(y), r2=88(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 56
LDI r2, 88
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
