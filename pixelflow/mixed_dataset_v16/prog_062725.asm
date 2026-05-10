; DESCRIPTION: Creates a black rectangular region at (305, 200) spanning 40 by 34 pixels.
; PLAN: r0=305(x), r1=200(y), r2=40(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 200
LDI r2, 40
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
