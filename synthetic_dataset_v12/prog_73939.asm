; DESCRIPTION: Creates a yellow rectangular region at (10, 159) spanning 85 by 17 pixels.
; PLAN: r0=10(x), r1=159(y), r2=85(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 159
LDI r2, 85
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
