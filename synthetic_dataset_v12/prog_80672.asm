; DESCRIPTION: Renders a black box of size 13x10 starting at (205, 159).
; PLAN: r0=205(x), r1=159(y), r2=13(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 159
LDI r2, 13
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
