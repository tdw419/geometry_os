; DESCRIPTION: Creates a yellow rectangular region at (324, 157) spanning 117 by 76 pixels.
; PLAN: r0=324(x), r1=157(y), r2=117(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 157
LDI r2, 117
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
