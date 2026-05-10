; DESCRIPTION: Creates a black rectangular region at (370, 20) spanning 100 by 77 pixels.
; PLAN: r0=370(x), r1=20(y), r2=100(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 20
LDI r2, 100
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
