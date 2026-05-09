; DESCRIPTION: Creates a yellow rectangular region at (74, 46) spanning 105 by 93 pixels.
; PLAN: r0=74(x), r1=46(y), r2=105(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 46
LDI r2, 105
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
