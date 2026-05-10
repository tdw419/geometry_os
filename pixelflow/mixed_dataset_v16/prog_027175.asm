; DESCRIPTION: Renders a yellow rectangular region spanning 38 by 65 at (58, 168).
; PLAN: r0=58(x), r1=168(y), r2=38(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 168
LDI r2, 38
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
