; DESCRIPTION: Creates a black rectangular region at (105, 58) spanning 48 by 86 pixels.
; PLAN: r0=105(x), r1=58(y), r2=48(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 58
LDI r2, 48
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
