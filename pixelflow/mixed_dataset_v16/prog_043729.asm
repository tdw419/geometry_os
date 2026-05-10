; DESCRIPTION: Renders a green box of size 53x65 starting at (20, 7).
; PLAN: r0=20(x), r1=7(y), r2=53(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 7
LDI r2, 53
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
