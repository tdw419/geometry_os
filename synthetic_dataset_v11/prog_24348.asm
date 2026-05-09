; DESCRIPTION: Creates a white rectangular region at (88, 59) spanning 116 by 104 pixels.
; PLAN: r0=88(x), r1=59(y), r2=116(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 59
LDI r2, 116
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
