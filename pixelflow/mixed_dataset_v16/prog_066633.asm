; DESCRIPTION: Creates a black rectangular region at (464, 176) spanning 29 by 21 pixels.
; PLAN: r0=464(x), r1=176(y), r2=29(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 176
LDI r2, 29
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
