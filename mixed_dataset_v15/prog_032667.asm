; DESCRIPTION: Creates a black rectangular region at (438, 215) spanning 17 by 14 pixels.
; PLAN: r0=438(x), r1=215(y), r2=17(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 215
LDI r2, 17
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
