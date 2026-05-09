; DESCRIPTION: Creates a yellow rectangular region at (378, 164) spanning 100 by 76 pixels.
; PLAN: r0=378(x), r1=164(y), r2=100(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 164
LDI r2, 100
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
