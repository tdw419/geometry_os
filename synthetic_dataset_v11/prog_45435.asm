; DESCRIPTION: Renders a yellow box of size 85x17 starting at (99, 126).
; PLAN: r0=99(x), r1=126(y), r2=85(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 126
LDI r2, 85
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
