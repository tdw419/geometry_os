; DESCRIPTION: Renders a yellow box of size 80x103 starting at (244, 49).
; PLAN: r0=244(x), r1=49(y), r2=80(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 49
LDI r2, 80
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
