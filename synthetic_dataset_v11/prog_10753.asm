; DESCRIPTION: Renders a black box of size 104x53 starting at (80, 34).
; PLAN: r0=80(x), r1=34(y), r2=104(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 34
LDI r2, 104
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
