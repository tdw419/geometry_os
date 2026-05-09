; DESCRIPTION: Creates a yellow rectangular region at (233, 7) spanning 44 by 109 pixels.
; PLAN: r0=233(x), r1=7(y), r2=44(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 7
LDI r2, 44
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
