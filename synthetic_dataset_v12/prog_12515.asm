; DESCRIPTION: Creates a cyan rectangular region at (191, 17) spanning 47 by 71 pixels.
; PLAN: r0=191(x), r1=17(y), r2=47(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 17
LDI r2, 47
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
