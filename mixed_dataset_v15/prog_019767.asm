; DESCRIPTION: Creates a cyan rectangular region at (106, 17) spanning 46 by 21 pixels.
; PLAN: r0=106(x), r1=17(y), r2=46(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 17
LDI r2, 46
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
