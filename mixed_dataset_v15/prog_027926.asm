; DESCRIPTION: Creates a white rectangular region at (368, 46) spanning 43 by 101 pixels.
; PLAN: r0=368(x), r1=46(y), r2=43(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 46
LDI r2, 43
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
