; DESCRIPTION: Creates a black rectangular region at (133, 196) spanning 12 by 40 pixels.
; PLAN: r0=133(x), r1=196(y), r2=12(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 196
LDI r2, 12
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
