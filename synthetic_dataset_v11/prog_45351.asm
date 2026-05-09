; DESCRIPTION: Creates a yellow rectangular region at (155, 12) spanning 92 by 50 pixels.
; PLAN: r0=155(x), r1=12(y), r2=92(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 12
LDI r2, 92
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
