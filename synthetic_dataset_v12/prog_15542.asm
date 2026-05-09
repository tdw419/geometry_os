; DESCRIPTION: Creates a black rectangular region at (150, 154) spanning 17 by 55 pixels.
; PLAN: r0=150(x), r1=154(y), r2=17(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 154
LDI r2, 17
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
