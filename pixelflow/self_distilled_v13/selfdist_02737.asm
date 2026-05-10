; DESCRIPTION: Renders a yellow rectangular region spanning 54 by 98 at (336, 14).
; PLAN: r0=336(x), r1=14(y), r2=54(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 14
LDI r2, 54
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
