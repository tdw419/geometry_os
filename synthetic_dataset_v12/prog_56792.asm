; DESCRIPTION: Renders a yellow box of size 60x46 starting at (9, 2).
; PLAN: r0=9(x), r1=2(y), r2=60(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 2
LDI r2, 60
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
