; DESCRIPTION: Renders a green box of size 81x24 starting at (72, 3).
; PLAN: r0=72(x), r1=3(y), r2=81(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 3
LDI r2, 81
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
