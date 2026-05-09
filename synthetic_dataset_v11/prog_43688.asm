; DESCRIPTION: Creates a cyan rectangular region at (152, 70) spanning 83 by 100 pixels.
; PLAN: r0=152(x), r1=70(y), r2=83(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 70
LDI r2, 83
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
