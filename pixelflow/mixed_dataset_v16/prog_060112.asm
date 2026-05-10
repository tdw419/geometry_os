; DESCRIPTION: Creates a black rectangular region at (444, 57) spanning 12 by 95 pixels.
; PLAN: r0=444(x), r1=57(y), r2=12(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 57
LDI r2, 12
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
