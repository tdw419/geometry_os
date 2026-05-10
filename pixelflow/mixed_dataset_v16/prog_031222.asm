; DESCRIPTION: Creates a cyan rectangular region at (17, 152) spanning 60 by 14 pixels.
; PLAN: r0=17(x), r1=152(y), r2=60(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 152
LDI r2, 60
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
