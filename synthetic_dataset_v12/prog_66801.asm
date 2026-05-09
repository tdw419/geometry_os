; DESCRIPTION: Creates a cyan rectangular region at (436, 4) spanning 53 by 34 pixels.
; PLAN: r0=436(x), r1=4(y), r2=53(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 4
LDI r2, 53
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
