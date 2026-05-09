; DESCRIPTION: Creates a orange rectangular region at (436, 37) spanning 29 by 71 pixels.
; PLAN: r0=436(x), r1=37(y), r2=29(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 37
LDI r2, 29
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
