; DESCRIPTION: Renders a yellow rectangular region spanning 73 by 77 at (212, 198).
; PLAN: r0=212(x), r1=198(y), r2=73(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 198
LDI r2, 73
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
