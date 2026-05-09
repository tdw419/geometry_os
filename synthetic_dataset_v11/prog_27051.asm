; DESCRIPTION: Renders a yellow box of size 23x103 starting at (30, 7).
; PLAN: r0=30(x), r1=7(y), r2=23(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 7
LDI r2, 23
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
