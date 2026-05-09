; DESCRIPTION: Creates a white rectangular region at (371, 108) spanning 12 by 21 pixels.
; PLAN: r0=371(x), r1=108(y), r2=12(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 108
LDI r2, 12
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
