; DESCRIPTION: Creates a black rectangular region at (354, 65) spanning 95 by 104 pixels.
; PLAN: r0=354(x), r1=65(y), r2=95(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 65
LDI r2, 95
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
