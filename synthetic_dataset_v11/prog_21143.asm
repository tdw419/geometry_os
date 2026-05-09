; DESCRIPTION: Renders a yellow box of size 10x18 starting at (240, 40).
; PLAN: r0=240(x), r1=40(y), r2=10(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 40
LDI r2, 10
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
