; DESCRIPTION: Creates a cyan rectangular region at (159, 25) spanning 17 by 29 pixels.
; PLAN: r0=159(x), r1=25(y), r2=17(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 25
LDI r2, 17
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
