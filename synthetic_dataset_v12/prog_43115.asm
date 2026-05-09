; DESCRIPTION: Creates a black rectangular region at (35, 120) spanning 80 by 97 pixels.
; PLAN: r0=35(x), r1=120(y), r2=80(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 120
LDI r2, 80
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
