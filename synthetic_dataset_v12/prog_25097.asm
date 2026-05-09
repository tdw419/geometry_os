; DESCRIPTION: Renders a green box of size 23x53 starting at (454, 8).
; PLAN: r0=454(x), r1=8(y), r2=23(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 8
LDI r2, 23
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
