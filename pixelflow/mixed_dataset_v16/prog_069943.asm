; DESCRIPTION: Renders a yellow box of size 34x73 starting at (361, 121).
; PLAN: r0=361(x), r1=121(y), r2=34(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 121
LDI r2, 34
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
