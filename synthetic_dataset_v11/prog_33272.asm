; DESCRIPTION: Creates a black rectangular region at (175, 111) spanning 79 by 99 pixels.
; PLAN: r0=175(x), r1=111(y), r2=79(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 111
LDI r2, 79
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
