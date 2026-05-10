; DESCRIPTION: Creates a cyan rectangular region at (1, 83) spanning 46 by 54 pixels.
; PLAN: r0=1(x), r1=83(y), r2=46(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 83
LDI r2, 46
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
