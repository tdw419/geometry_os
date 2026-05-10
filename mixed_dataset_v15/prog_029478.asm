; DESCRIPTION: Creates a yellow rectangular region at (212, 54) spanning 113 by 59 pixels.
; PLAN: r0=212(x), r1=54(y), r2=113(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 54
LDI r2, 113
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
