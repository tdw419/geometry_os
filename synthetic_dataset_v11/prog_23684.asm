; DESCRIPTION: Renders a black box of size 38x60 starting at (22, 63).
; PLAN: r0=22(x), r1=63(y), r2=38(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 63
LDI r2, 38
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
