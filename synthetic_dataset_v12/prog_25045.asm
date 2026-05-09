; DESCRIPTION: Creates a white rectangular region at (147, 131) spanning 76 by 90 pixels.
; PLAN: r0=147(x), r1=131(y), r2=76(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 131
LDI r2, 76
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
