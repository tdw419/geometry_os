; DESCRIPTION: Creates a yellow rectangular region at (44, 47) spanning 100 by 93 pixels.
; PLAN: r0=44(x), r1=47(y), r2=100(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 47
LDI r2, 100
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
