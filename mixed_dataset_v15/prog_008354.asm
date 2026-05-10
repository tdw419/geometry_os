; DESCRIPTION: Creates a yellow rectangular region at (287, 108) spanning 54 by 25 pixels.
; PLAN: r0=287(x), r1=108(y), r2=54(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 108
LDI r2, 54
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
