; DESCRIPTION: Renders a yellow box of size 65x63 starting at (184, 126).
; PLAN: r0=184(x), r1=126(y), r2=65(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 126
LDI r2, 65
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
