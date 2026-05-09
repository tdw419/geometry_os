; DESCRIPTION: Renders a black box of size 80x53 starting at (54, 7).
; PLAN: r0=54(x), r1=7(y), r2=80(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 7
LDI r2, 80
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
