; DESCRIPTION: Creates a black rectangular region at (98, 173) spanning 54 by 80 pixels.
; PLAN: r0=98(x), r1=173(y), r2=54(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 173
LDI r2, 54
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
