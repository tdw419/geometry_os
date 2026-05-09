; DESCRIPTION: Creates a black rectangular region at (8, 152) spanning 31 by 45 pixels.
; PLAN: r0=8(x), r1=152(y), r2=31(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 152
LDI r2, 31
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
