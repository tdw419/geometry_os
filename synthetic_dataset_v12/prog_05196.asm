; DESCRIPTION: Creates a cyan rectangular region at (306, 181) spanning 17 by 17 pixels.
; PLAN: r0=306(x), r1=181(y), r2=17(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 181
LDI r2, 17
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
