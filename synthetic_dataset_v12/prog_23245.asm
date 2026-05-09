; DESCRIPTION: Creates a yellow rectangular region at (430, 112) spanning 12 by 109 pixels.
; PLAN: r0=430(x), r1=112(y), r2=12(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 112
LDI r2, 12
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
