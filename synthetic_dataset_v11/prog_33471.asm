; DESCRIPTION: Creates a black rectangular region at (69, 124) spanning 21 by 100 pixels.
; PLAN: r0=69(x), r1=124(y), r2=21(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 124
LDI r2, 21
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
