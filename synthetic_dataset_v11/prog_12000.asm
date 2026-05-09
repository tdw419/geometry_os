; DESCRIPTION: Creates a cyan rectangular region at (56, 83) spanning 109 by 55 pixels.
; PLAN: r0=56(x), r1=83(y), r2=109(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 83
LDI r2, 109
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
