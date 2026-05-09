; DESCRIPTION: Creates a black rectangular region at (121, 70) spanning 91 by 45 pixels.
; PLAN: r0=121(x), r1=70(y), r2=91(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 70
LDI r2, 91
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
