; DESCRIPTION: Creates a black rectangular region at (148, 211) spanning 10 by 12 pixels.
; PLAN: r0=148(x), r1=211(y), r2=10(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 211
LDI r2, 10
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
