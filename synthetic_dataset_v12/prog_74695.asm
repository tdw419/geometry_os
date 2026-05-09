; DESCRIPTION: Creates a yellow rectangular region at (235, 19) spanning 71 by 66 pixels.
; PLAN: r0=235(x), r1=19(y), r2=71(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 19
LDI r2, 71
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
