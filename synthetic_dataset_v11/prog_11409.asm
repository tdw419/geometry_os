; DESCRIPTION: Renders a yellow box of size 76x103 starting at (30, 56).
; PLAN: r0=30(x), r1=56(y), r2=76(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 56
LDI r2, 76
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
