; DESCRIPTION: Renders a green box of size 43x37 starting at (3, 210).
; PLAN: r0=3(x), r1=210(y), r2=43(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 210
LDI r2, 43
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
