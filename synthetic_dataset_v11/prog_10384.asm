; DESCRIPTION: Creates a cyan rectangular region at (147, 17) spanning 108 by 44 pixels.
; PLAN: r0=147(x), r1=17(y), r2=108(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 17
LDI r2, 108
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
