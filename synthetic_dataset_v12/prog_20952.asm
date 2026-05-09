; DESCRIPTION: Creates a yellow rectangular region at (81, 113) spanning 48 by 97 pixels.
; PLAN: r0=81(x), r1=113(y), r2=48(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 113
LDI r2, 48
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
