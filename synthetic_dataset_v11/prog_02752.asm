; DESCRIPTION: Renders a white box of size 63x80 starting at (19, 23).
; PLAN: r0=19(x), r1=23(y), r2=63(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 23
LDI r2, 63
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
