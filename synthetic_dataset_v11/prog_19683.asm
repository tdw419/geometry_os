; DESCRIPTION: Renders a green box of size 56x53 starting at (114, 65).
; PLAN: r0=114(x), r1=65(y), r2=56(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 65
LDI r2, 56
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
