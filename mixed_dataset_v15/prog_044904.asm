; DESCRIPTION: Creates a yellow rectangular region at (191, 95) spanning 21 by 112 pixels.
; PLAN: r0=191(x), r1=95(y), r2=21(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 95
LDI r2, 21
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
