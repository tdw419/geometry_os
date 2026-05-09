; DESCRIPTION: Creates a black rectangular region at (247, 112) spanning 43 by 109 pixels.
; PLAN: r0=247(x), r1=112(y), r2=43(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 112
LDI r2, 43
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
