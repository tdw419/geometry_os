; DESCRIPTION: Creates a yellow rectangular region at (68, 195) spanning 106 by 47 pixels.
; PLAN: r0=68(x), r1=195(y), r2=106(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 195
LDI r2, 106
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
