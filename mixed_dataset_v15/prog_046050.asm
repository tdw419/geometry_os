; DESCRIPTION: Renders a yellow box of size 80x76 starting at (86, 104).
; PLAN: r0=86(x), r1=104(y), r2=80(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 104
LDI r2, 80
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
