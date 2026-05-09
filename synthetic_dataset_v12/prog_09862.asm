; DESCRIPTION: Renders a yellow box of size 86x63 starting at (293, 191).
; PLAN: r0=293(x), r1=191(y), r2=86(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 191
LDI r2, 86
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
