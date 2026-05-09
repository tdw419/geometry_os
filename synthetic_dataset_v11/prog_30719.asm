; DESCRIPTION: Renders a yellow box of size 17x70 starting at (157, 157).
; PLAN: r0=157(x), r1=157(y), r2=17(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 157
LDI r2, 17
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
