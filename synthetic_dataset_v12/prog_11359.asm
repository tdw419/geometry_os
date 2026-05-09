; DESCRIPTION: Creates a yellow rectangular region at (320, 7) spanning 72 by 90 pixels.
; PLAN: r0=320(x), r1=7(y), r2=72(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 7
LDI r2, 72
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
