; DESCRIPTION: Renders a yellow box of size 10x58 starting at (198, 184).
; PLAN: r0=198(x), r1=184(y), r2=10(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 184
LDI r2, 10
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
