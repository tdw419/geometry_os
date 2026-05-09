; DESCRIPTION: Creates a black rectangular region at (33, 32) spanning 108 by 120 pixels.
; PLAN: r0=33(x), r1=32(y), r2=108(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 32
LDI r2, 108
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
