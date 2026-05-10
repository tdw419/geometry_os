; DESCRIPTION: Creates a cyan rectangular region at (364, 43) spanning 54 by 90 pixels.
; PLAN: r0=364(x), r1=43(y), r2=54(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 43
LDI r2, 54
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
