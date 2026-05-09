; DESCRIPTION: Creates a black rectangular region at (84, 129) spanning 61 by 11 pixels.
; PLAN: r0=84(x), r1=129(y), r2=61(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 129
LDI r2, 61
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
