; DESCRIPTION: Creates a black rectangular region at (191, 17) spanning 65 by 120 pixels.
; PLAN: r0=191(x), r1=17(y), r2=65(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 17
LDI r2, 65
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
