; DESCRIPTION: Creates a yellow rectangular region at (122, 120) spanning 70 by 45 pixels.
; PLAN: r0=122(x), r1=120(y), r2=70(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 120
LDI r2, 70
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
