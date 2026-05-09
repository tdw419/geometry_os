; DESCRIPTION: Renders a yellow box of size 34x34 starting at (238, 157).
; PLAN: r0=238(x), r1=157(y), r2=34(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 157
LDI r2, 34
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
