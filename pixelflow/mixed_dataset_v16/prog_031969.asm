; DESCRIPTION: Creates a black rectangular region at (166, 149) spanning 104 by 87 pixels.
; PLAN: r0=166(x), r1=149(y), r2=104(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 149
LDI r2, 104
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
