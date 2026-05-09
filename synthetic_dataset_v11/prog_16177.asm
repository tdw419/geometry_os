; DESCRIPTION: Renders a black box of size 80x28 starting at (10, 84).
; PLAN: r0=10(x), r1=84(y), r2=80(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 84
LDI r2, 80
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
