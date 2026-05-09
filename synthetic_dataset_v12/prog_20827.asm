; DESCRIPTION: Renders a yellow box of size 24x53 starting at (443, 100).
; PLAN: r0=443(x), r1=100(y), r2=24(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 100
LDI r2, 24
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
