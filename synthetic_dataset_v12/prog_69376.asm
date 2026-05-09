; DESCRIPTION: Creates a yellow rectangular region at (230, 135) spanning 83 by 95 pixels.
; PLAN: r0=230(x), r1=135(y), r2=83(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 135
LDI r2, 83
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
