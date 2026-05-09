; DESCRIPTION: Creates a yellow rectangular region at (219, 116) spanning 21 by 45 pixels.
; PLAN: r0=219(x), r1=116(y), r2=21(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 116
LDI r2, 21
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
