; DESCRIPTION: Creates a purple rectangular region at (173, 9) spanning 102 by 21 pixels.
; PLAN: r0=173(x), r1=9(y), r2=102(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 9
LDI r2, 102
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
