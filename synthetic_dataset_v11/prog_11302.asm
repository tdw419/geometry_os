; DESCRIPTION: Renders a green box of size 46x20 starting at (141, 141).
; PLAN: r0=141(x), r1=141(y), r2=46(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 141
LDI r2, 46
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
