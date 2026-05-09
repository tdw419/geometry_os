; DESCRIPTION: Renders a black box of size 62x120 starting at (250, 65).
; PLAN: r0=250(x), r1=65(y), r2=62(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 65
LDI r2, 62
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
