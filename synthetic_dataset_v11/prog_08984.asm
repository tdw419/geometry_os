; DESCRIPTION: Renders a green box of size 40x55 starting at (195, 90).
; PLAN: r0=195(x), r1=90(y), r2=40(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 90
LDI r2, 40
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
