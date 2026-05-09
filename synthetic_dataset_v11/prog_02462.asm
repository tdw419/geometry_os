; DESCRIPTION: Creates a black rectangular region at (50, 50) spanning 33 by 102 pixels.
; PLAN: r0=50(x), r1=50(y), r2=33(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 50
LDI r2, 33
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
