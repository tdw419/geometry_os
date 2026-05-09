; DESCRIPTION: Creates a white rectangular region at (104, 132) spanning 58 by 81 pixels.
; PLAN: r0=104(x), r1=132(y), r2=58(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 132
LDI r2, 58
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
