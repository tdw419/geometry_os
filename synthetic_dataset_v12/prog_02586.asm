; DESCRIPTION: Creates a red rectangular region at (260, 49) spanning 33 by 24 pixels.
; PLAN: r0=260(x), r1=49(y), r2=33(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 49
LDI r2, 33
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
