; DESCRIPTION: Creates a orange rectangular region at (436, 73) spanning 30 by 73 pixels.
; PLAN: r0=436(x), r1=73(y), r2=30(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 73
LDI r2, 30
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
