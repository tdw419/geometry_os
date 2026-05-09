; DESCRIPTION: Creates a yellow rectangular region at (104, 68) spanning 63 by 116 pixels.
; PLAN: r0=104(x), r1=68(y), r2=63(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 68
LDI r2, 63
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
