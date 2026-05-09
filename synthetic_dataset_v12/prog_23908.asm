; DESCRIPTION: Creates a black rectangular region at (208, 29) spanning 47 by 36 pixels.
; PLAN: r0=208(x), r1=29(y), r2=47(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 29
LDI r2, 47
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
