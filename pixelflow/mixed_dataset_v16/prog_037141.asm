; DESCRIPTION: Creates a black rectangular region at (413, 22) spanning 44 by 70 pixels.
; PLAN: r0=413(x), r1=22(y), r2=44(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 22
LDI r2, 44
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
