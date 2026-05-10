; DESCRIPTION: Creates a yellow rectangular region at (128, 35) spanning 27 by 104 pixels.
; PLAN: r0=128(x), r1=35(y), r2=27(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 35
LDI r2, 27
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
