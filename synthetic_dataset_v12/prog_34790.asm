; DESCRIPTION: Renders a black box of size 14x50 starting at (132, 181).
; PLAN: r0=132(x), r1=181(y), r2=14(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 181
LDI r2, 14
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
