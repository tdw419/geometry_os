; DESCRIPTION: Renders a green box of size 24x37 starting at (353, 199).
; PLAN: r0=353(x), r1=199(y), r2=24(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 199
LDI r2, 24
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
