; DESCRIPTION: Creates a yellow rectangular region at (39, 165) spanning 97 by 75 pixels.
; PLAN: r0=39(x), r1=165(y), r2=97(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 165
LDI r2, 97
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
