; DESCRIPTION: Creates a yellow rectangular region at (26, 96) spanning 107 by 117 pixels.
; PLAN: r0=26(x), r1=96(y), r2=107(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 96
LDI r2, 107
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
