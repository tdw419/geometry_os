; DESCRIPTION: Creates a black rectangular region at (18, 163) spanning 48 by 40 pixels.
; PLAN: r0=18(x), r1=163(y), r2=48(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 163
LDI r2, 48
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
