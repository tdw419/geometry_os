; DESCRIPTION: Renders a yellow box of size 64x13 starting at (149, 126).
; PLAN: r0=149(x), r1=126(y), r2=64(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 126
LDI r2, 64
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
