; DESCRIPTION: Creates a yellow rectangular region at (167, 125) spanning 80 by 38 pixels.
; PLAN: r0=167(x), r1=125(y), r2=80(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 125
LDI r2, 80
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
