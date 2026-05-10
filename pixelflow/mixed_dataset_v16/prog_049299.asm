; DESCRIPTION: Renders a yellow rectangular region spanning 87 by 20 at (302, 193).
; PLAN: r0=302(x), r1=193(y), r2=87(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 193
LDI r2, 87
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
