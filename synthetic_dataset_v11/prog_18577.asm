; DESCRIPTION: Renders a yellow box of size 80x35 starting at (142, 204).
; PLAN: r0=142(x), r1=204(y), r2=80(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 204
LDI r2, 80
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
