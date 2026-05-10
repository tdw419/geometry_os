; DESCRIPTION: Creates a black rectangular region at (151, 56) spanning 44 by 86 pixels.
; PLAN: r0=151(x), r1=56(y), r2=44(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 56
LDI r2, 44
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
