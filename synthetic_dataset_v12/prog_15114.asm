; DESCRIPTION: Creates a black rectangular region at (167, 193) spanning 10 by 37 pixels.
; PLAN: r0=167(x), r1=193(y), r2=10(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 193
LDI r2, 10
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
