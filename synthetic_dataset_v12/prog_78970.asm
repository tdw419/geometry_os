; DESCRIPTION: Creates a white rectangular region at (222, 83) spanning 16 by 117 pixels.
; PLAN: r0=222(x), r1=83(y), r2=16(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 83
LDI r2, 16
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
