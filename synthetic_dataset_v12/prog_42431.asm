; DESCRIPTION: Creates a yellow rectangular region at (436, 10) spanning 46 by 69 pixels.
; PLAN: r0=436(x), r1=10(y), r2=46(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 10
LDI r2, 46
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
