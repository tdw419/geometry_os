; DESCRIPTION: Creates a yellow rectangular region at (23, 111) spanning 47 by 58 pixels.
; PLAN: r0=23(x), r1=111(y), r2=47(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 111
LDI r2, 47
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
