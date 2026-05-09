; DESCRIPTION: Creates a yellow rectangular region at (198, 134) spanning 112 by 43 pixels.
; PLAN: r0=198(x), r1=134(y), r2=112(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 134
LDI r2, 112
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
