; DESCRIPTION: Creates a black rectangular region at (91, 48) spanning 40 by 72 pixels.
; PLAN: r0=91(x), r1=48(y), r2=40(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 48
LDI r2, 40
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
