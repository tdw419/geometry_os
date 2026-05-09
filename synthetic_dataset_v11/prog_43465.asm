; DESCRIPTION: Creates a yellow rectangular region at (160, 82) spanning 35 by 69 pixels.
; PLAN: r0=160(x), r1=82(y), r2=35(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 82
LDI r2, 35
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
