; DESCRIPTION: Creates a black rectangular region at (369, 134) spanning 71 by 104 pixels.
; PLAN: r0=369(x), r1=134(y), r2=71(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 134
LDI r2, 71
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
