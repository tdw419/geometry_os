; DESCRIPTION: Creates a black rectangular region at (263, 12) spanning 95 by 31 pixels.
; PLAN: r0=263(x), r1=12(y), r2=95(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 12
LDI r2, 95
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
