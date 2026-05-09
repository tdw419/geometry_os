; DESCRIPTION: Creates a yellow rectangular region at (210, 133) spanning 39 by 54 pixels.
; PLAN: r0=210(x), r1=133(y), r2=39(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 133
LDI r2, 39
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
