; DESCRIPTION: Creates a black rectangular region at (391, 215) spanning 33 by 14 pixels.
; PLAN: r0=391(x), r1=215(y), r2=33(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 215
LDI r2, 33
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
