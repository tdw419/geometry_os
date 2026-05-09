; DESCRIPTION: Creates a white rectangular region at (272, 33) spanning 24 by 104 pixels.
; PLAN: r0=272(x), r1=33(y), r2=24(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 33
LDI r2, 24
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
