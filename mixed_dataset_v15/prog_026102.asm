; DESCRIPTION: Creates a purple rectangular region at (364, 47) spanning 83 by 98 pixels.
; PLAN: r0=364(x), r1=47(y), r2=83(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 47
LDI r2, 83
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
