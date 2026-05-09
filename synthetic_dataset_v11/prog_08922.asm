; DESCRIPTION: Creates a red rectangular region at (29, 135) spanning 31 by 91 pixels.
; PLAN: r0=29(x), r1=135(y), r2=31(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 135
LDI r2, 31
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
