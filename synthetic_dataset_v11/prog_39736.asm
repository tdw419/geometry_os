; DESCRIPTION: Creates a black rectangular region at (164, 100) spanning 73 by 117 pixels.
; PLAN: r0=164(x), r1=100(y), r2=73(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 100
LDI r2, 73
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
