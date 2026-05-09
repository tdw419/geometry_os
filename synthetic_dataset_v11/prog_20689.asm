; DESCRIPTION: Creates a yellow rectangular region at (37, 131) spanning 76 by 21 pixels.
; PLAN: r0=37(x), r1=131(y), r2=76(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 131
LDI r2, 76
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
