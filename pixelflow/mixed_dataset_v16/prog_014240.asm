; DESCRIPTION: Renders a yellow rectangular region spanning 40 by 98 at (244, 184).
; PLAN: r0=244(x), r1=184(y), r2=40(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 184
LDI r2, 40
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
