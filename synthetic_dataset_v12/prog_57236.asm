; DESCRIPTION: Creates a black rectangular region at (422, 158) spanning 12 by 57 pixels.
; PLAN: r0=422(x), r1=158(y), r2=12(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 158
LDI r2, 12
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
