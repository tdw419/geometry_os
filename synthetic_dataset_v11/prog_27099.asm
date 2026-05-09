; DESCRIPTION: Creates a black rectangular region at (168, 161) spanning 88 by 89 pixels.
; PLAN: r0=168(x), r1=161(y), r2=88(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 161
LDI r2, 88
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
