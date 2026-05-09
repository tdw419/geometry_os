; DESCRIPTION: Renders a yellow box of size 23x53 starting at (416, 0).
; PLAN: r0=416(x), r1=0(y), r2=23(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 0
LDI r2, 23
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
