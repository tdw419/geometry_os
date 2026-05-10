; DESCRIPTION: Renders a green box of size 63x55 starting at (3, 73).
; PLAN: r0=3(x), r1=73(y), r2=63(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 73
LDI r2, 63
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
