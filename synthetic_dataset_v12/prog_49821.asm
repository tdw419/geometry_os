; DESCRIPTION: Renders a magenta box of size 99x21 starting at (227, 32).
; PLAN: r0=227(x), r1=32(y), r2=99(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 32
LDI r2, 99
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
