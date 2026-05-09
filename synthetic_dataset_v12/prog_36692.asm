; DESCRIPTION: Renders a black box of size 10x25 starting at (495, 149).
; PLAN: r0=495(x), r1=149(y), r2=10(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 149
LDI r2, 10
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
