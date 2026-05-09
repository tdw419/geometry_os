; DESCRIPTION: Creates a yellow rectangular region at (59, 83) spanning 98 by 92 pixels.
; PLAN: r0=59(x), r1=83(y), r2=98(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 83
LDI r2, 98
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
