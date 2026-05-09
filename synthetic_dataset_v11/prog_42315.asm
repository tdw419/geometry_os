; DESCRIPTION: Creates a cyan rectangular region at (225, 232) spanning 14 by 17 pixels.
; PLAN: r0=225(x), r1=232(y), r2=14(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 232
LDI r2, 14
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
