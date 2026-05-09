; DESCRIPTION: Renders a black box of size 76x99 starting at (54, 63).
; PLAN: r0=54(x), r1=63(y), r2=76(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 63
LDI r2, 76
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
