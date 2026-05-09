; DESCRIPTION: Renders a yellow box of size 20x37 starting at (205, 46).
; PLAN: r0=205(x), r1=46(y), r2=20(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 46
LDI r2, 20
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
