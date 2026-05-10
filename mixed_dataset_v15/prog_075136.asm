; DESCRIPTION: Creates a black rectangular region at (173, 218) spanning 109 by 36 pixels.
; PLAN: r0=173(x), r1=218(y), r2=109(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 218
LDI r2, 109
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
