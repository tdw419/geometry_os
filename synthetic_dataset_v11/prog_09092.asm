; DESCRIPTION: Creates a black rectangular region at (92, 69) spanning 15 by 79 pixels.
; PLAN: r0=92(x), r1=69(y), r2=15(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 69
LDI r2, 15
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
