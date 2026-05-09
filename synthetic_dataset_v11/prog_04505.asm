; DESCRIPTION: Creates a white rectangular region at (23, 108) spanning 104 by 120 pixels.
; PLAN: r0=23(x), r1=108(y), r2=104(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 108
LDI r2, 104
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
