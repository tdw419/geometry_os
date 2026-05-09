; DESCRIPTION: Creates a red rectangular region at (119, 135) spanning 33 by 68 pixels.
; PLAN: r0=119(x), r1=135(y), r2=33(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 135
LDI r2, 33
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
