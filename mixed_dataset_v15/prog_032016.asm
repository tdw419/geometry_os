; DESCRIPTION: Creates a orange rectangular region at (320, 90) spanning 15 by 104 pixels.
; PLAN: r0=320(x), r1=90(y), r2=15(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 90
LDI r2, 15
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
