; DESCRIPTION: Creates a yellow rectangular region at (39, 117) spanning 98 by 112 pixels.
; PLAN: r0=39(x), r1=117(y), r2=98(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 117
LDI r2, 98
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
