; DESCRIPTION: Renders a yellow box of size 45x115 starting at (181, 13).
; PLAN: r0=181(x), r1=13(y), r2=45(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 13
LDI r2, 45
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
