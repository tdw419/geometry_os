; DESCRIPTION: Creates a cyan rectangular region at (159, 151) spanning 17 by 102 pixels.
; PLAN: r0=159(x), r1=151(y), r2=17(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 151
LDI r2, 17
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
