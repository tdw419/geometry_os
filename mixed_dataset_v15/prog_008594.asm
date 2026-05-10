; DESCRIPTION: Creates a black rectangular region at (180, 148) spanning 62 by 56 pixels.
; PLAN: r0=180(x), r1=148(y), r2=62(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 148
LDI r2, 62
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
