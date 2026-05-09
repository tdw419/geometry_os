; DESCRIPTION: Creates a black rectangular region at (320, 15) spanning 120 by 60 pixels.
; PLAN: r0=320(x), r1=15(y), r2=120(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 15
LDI r2, 120
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
