; DESCRIPTION: Creates a black rectangular region at (50, 191) spanning 88 by 47 pixels.
; PLAN: r0=50(x), r1=191(y), r2=88(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 191
LDI r2, 88
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
