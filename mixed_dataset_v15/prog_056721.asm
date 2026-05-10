; DESCRIPTION: Creates a black rectangular region at (172, 208) spanning 19 by 28 pixels.
; PLAN: r0=172(x), r1=208(y), r2=19(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 208
LDI r2, 19
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
