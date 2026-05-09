; DESCRIPTION: Creates a yellow rectangular region at (214, 58) spanning 35 by 65 pixels.
; PLAN: r0=214(x), r1=58(y), r2=35(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 58
LDI r2, 35
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
