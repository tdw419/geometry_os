; DESCRIPTION: Creates a black rectangular region at (263, 69) spanning 83 by 47 pixels.
; PLAN: r0=263(x), r1=69(y), r2=83(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 69
LDI r2, 83
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
