; DESCRIPTION: Renders a green box of size 103x15 starting at (119, 20).
; PLAN: r0=119(x), r1=20(y), r2=103(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 20
LDI r2, 103
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
