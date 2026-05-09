; DESCRIPTION: Creates a black rectangular region at (95, 108) spanning 92 by 104 pixels.
; PLAN: r0=95(x), r1=108(y), r2=92(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 108
LDI r2, 92
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
