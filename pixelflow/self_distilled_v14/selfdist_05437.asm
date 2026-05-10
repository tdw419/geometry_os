; DESCRIPTION: Renders a yellow rectangular region spanning 92 by 92 at (65, 31).
; PLAN: r0=65(x), r1=31(y), r2=92(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 31
LDI r2, 92
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
