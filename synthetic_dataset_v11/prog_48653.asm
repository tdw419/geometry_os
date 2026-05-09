; DESCRIPTION: Creates a black rectangular region at (198, 117) spanning 33 by 73 pixels.
; PLAN: r0=198(x), r1=117(y), r2=33(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 117
LDI r2, 33
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
