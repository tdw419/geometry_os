; DESCRIPTION: Creates a black rectangular region at (180, 45) spanning 73 by 21 pixels.
; PLAN: r0=180(x), r1=45(y), r2=73(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 45
LDI r2, 73
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
