; DESCRIPTION: Renders a green box of size 55x37 starting at (315, 183).
; PLAN: r0=315(x), r1=183(y), r2=55(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 183
LDI r2, 55
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
