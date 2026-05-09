; DESCRIPTION: Creates a white rectangular region at (56, 21) spanning 68 by 104 pixels.
; PLAN: r0=56(x), r1=21(y), r2=68(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 21
LDI r2, 68
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
