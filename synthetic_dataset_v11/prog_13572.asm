; DESCRIPTION: Creates a red rectangular region at (112, 137) spanning 43 by 59 pixels.
; PLAN: r0=112(x), r1=137(y), r2=43(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 137
LDI r2, 43
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
