; DESCRIPTION: Creates a yellow rectangular region at (17, 180) spanning 55 by 58 pixels.
; PLAN: r0=17(x), r1=180(y), r2=55(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 180
LDI r2, 55
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
