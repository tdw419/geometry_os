; DESCRIPTION: Creates a red rectangular region at (382, 56) spanning 34 by 104 pixels.
; PLAN: r0=382(x), r1=56(y), r2=34(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 56
LDI r2, 34
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
