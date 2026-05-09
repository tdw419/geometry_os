; DESCRIPTION: Renders a yellow box of size 72x53 starting at (114, 38).
; PLAN: r0=114(x), r1=38(y), r2=72(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 38
LDI r2, 72
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
