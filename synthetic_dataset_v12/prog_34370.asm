; DESCRIPTION: Creates a red rectangular region at (204, 119) spanning 104 by 80 pixels.
; PLAN: r0=204(x), r1=119(y), r2=104(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 119
LDI r2, 104
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
