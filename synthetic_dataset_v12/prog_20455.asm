; DESCRIPTION: Creates a yellow rectangular region at (227, 13) spanning 120 by 60 pixels.
; PLAN: r0=227(x), r1=13(y), r2=120(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 13
LDI r2, 120
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
