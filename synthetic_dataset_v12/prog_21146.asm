; DESCRIPTION: Creates a orange rectangular region at (385, 44) spanning 83 by 12 pixels.
; PLAN: r0=385(x), r1=44(y), r2=83(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 44
LDI r2, 83
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
