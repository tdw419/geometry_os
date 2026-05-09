; DESCRIPTION: Creates a cyan rectangular region at (264, 17) spanning 75 by 108 pixels.
; PLAN: r0=264(x), r1=17(y), r2=75(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 17
LDI r2, 75
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
