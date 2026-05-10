; DESCRIPTION: Creates a purple rectangular region at (175, 114) spanning 86 by 52 pixels.
; PLAN: r0=175(x), r1=114(y), r2=86(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 114
LDI r2, 86
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
