; DESCRIPTION: Creates a white rectangular region at (9, 160) spanning 80 by 34 pixels.
; PLAN: r0=9(x), r1=160(y), r2=80(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 160
LDI r2, 80
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
