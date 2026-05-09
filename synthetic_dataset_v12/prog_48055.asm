; DESCRIPTION: Renders a green box of size 83x14 starting at (178, 155).
; PLAN: r0=178(x), r1=155(y), r2=83(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 155
LDI r2, 83
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
