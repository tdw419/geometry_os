; DESCRIPTION: Renders a yellow rectangular region spanning 117 by 108 at (353, 65).
; PLAN: r0=353(x), r1=65(y), r2=117(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 65
LDI r2, 117
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
