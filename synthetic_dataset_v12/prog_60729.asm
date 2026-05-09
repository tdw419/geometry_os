; DESCRIPTION: Creates a black rectangular region at (175, 138) spanning 114 by 27 pixels.
; PLAN: r0=175(x), r1=138(y), r2=114(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 138
LDI r2, 114
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
