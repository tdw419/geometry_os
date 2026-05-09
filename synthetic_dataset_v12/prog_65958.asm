; DESCRIPTION: Creates a black rectangular region at (273, 21) spanning 56 by 57 pixels.
; PLAN: r0=273(x), r1=21(y), r2=56(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 21
LDI r2, 56
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
