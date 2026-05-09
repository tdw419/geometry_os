; DESCRIPTION: Creates a black rectangular region at (48, 16) spanning 35 by 34 pixels.
; PLAN: r0=48(x), r1=16(y), r2=35(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 16
LDI r2, 35
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
