; DESCRIPTION: Creates a black rectangular region at (27, 69) spanning 90 by 33 pixels.
; PLAN: r0=27(x), r1=69(y), r2=90(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 69
LDI r2, 90
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
