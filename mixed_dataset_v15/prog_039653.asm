; DESCRIPTION: Renders a green box of size 108x107 starting at (312, 40).
; PLAN: r0=312(x), r1=40(y), r2=108(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 40
LDI r2, 108
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
