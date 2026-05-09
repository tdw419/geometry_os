; DESCRIPTION: Creates a yellow rectangular region at (144, 114) spanning 54 by 109 pixels.
; PLAN: r0=144(x), r1=114(y), r2=54(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 114
LDI r2, 54
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
