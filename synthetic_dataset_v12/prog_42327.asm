; DESCRIPTION: Renders a yellow box of size 100x103 starting at (126, 98).
; PLAN: r0=126(x), r1=98(y), r2=100(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 98
LDI r2, 100
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
