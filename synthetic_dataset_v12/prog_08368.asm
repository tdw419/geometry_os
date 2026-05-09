; DESCRIPTION: Creates a white rectangular region at (2, 39) spanning 104 by 39 pixels.
; PLAN: r0=2(x), r1=39(y), r2=104(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 39
LDI r2, 104
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
