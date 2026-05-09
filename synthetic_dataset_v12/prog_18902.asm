; DESCRIPTION: Creates a black rectangular region at (254, 162) spanning 16 by 34 pixels.
; PLAN: r0=254(x), r1=162(y), r2=16(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 162
LDI r2, 16
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
