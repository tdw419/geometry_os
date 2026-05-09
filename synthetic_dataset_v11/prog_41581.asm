; DESCRIPTION: Creates a white rectangular region at (104, 43) spanning 58 by 16 pixels.
; PLAN: r0=104(x), r1=43(y), r2=58(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 43
LDI r2, 58
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
