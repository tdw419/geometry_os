; DESCRIPTION: Renders a black box of size 10x25 starting at (13, 28).
; PLAN: r0=13(x), r1=28(y), r2=10(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 28
LDI r2, 10
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
