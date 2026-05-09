; DESCRIPTION: Creates a black rectangular region at (48, 23) spanning 68 by 31 pixels.
; PLAN: r0=48(x), r1=23(y), r2=68(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 23
LDI r2, 68
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
