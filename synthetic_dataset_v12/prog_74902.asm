; DESCRIPTION: Creates a black rectangular region at (25, 47) spanning 38 by 103 pixels.
; PLAN: r0=25(x), r1=47(y), r2=38(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 47
LDI r2, 38
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
