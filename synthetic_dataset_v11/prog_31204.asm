; DESCRIPTION: Creates a yellow rectangular region at (59, 74) spanning 107 by 106 pixels.
; PLAN: r0=59(x), r1=74(y), r2=107(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 74
LDI r2, 107
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
