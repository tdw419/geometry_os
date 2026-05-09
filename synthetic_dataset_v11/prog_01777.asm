; DESCRIPTION: Creates a black rectangular region at (38, 60) spanning 98 by 117 pixels.
; PLAN: r0=38(x), r1=60(y), r2=98(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 60
LDI r2, 98
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
