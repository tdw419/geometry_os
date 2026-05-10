; DESCRIPTION: Creates a yellow rectangular region at (73, 111) spanning 35 by 58 pixels.
; PLAN: r0=73(x), r1=111(y), r2=35(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 111
LDI r2, 35
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
