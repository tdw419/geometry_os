; DESCRIPTION: Creates a white rectangular region at (175, 59) spanning 54 by 101 pixels.
; PLAN: r0=175(x), r1=59(y), r2=54(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 59
LDI r2, 54
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
