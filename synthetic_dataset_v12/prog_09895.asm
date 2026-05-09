; DESCRIPTION: Creates a yellow rectangular region at (247, 39) spanning 54 by 105 pixels.
; PLAN: r0=247(x), r1=39(y), r2=54(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 39
LDI r2, 54
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
