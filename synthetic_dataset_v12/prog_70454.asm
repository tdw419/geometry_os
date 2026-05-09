; DESCRIPTION: Creates a yellow rectangular region at (184, 2) spanning 70 by 70 pixels.
; PLAN: r0=184(x), r1=2(y), r2=70(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 2
LDI r2, 70
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
