; DESCRIPTION: Creates a black rectangular region at (124, 118) spanning 113 by 54 pixels.
; PLAN: r0=124(x), r1=118(y), r2=113(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 118
LDI r2, 113
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
