; DESCRIPTION: Creates a black rectangular region at (260, 11) spanning 32 by 21 pixels.
; PLAN: r0=260(x), r1=11(y), r2=32(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 11
LDI r2, 32
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
