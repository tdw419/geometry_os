; DESCRIPTION: Creates a black rectangular region at (236, 188) spanning 117 by 49 pixels.
; PLAN: r0=236(x), r1=188(y), r2=117(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 188
LDI r2, 117
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
