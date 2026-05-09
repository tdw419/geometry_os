; DESCRIPTION: Creates a orange rectangular region at (255, 5) spanning 17 by 62 pixels.
; PLAN: r0=255(x), r1=5(y), r2=17(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 5
LDI r2, 17
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
