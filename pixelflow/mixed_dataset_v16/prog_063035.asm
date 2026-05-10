; DESCRIPTION: Creates a cyan rectangular region at (152, 31) spanning 29 by 108 pixels.
; PLAN: r0=152(x), r1=31(y), r2=29(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 31
LDI r2, 29
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
