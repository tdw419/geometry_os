; DESCRIPTION: Creates a black rectangular region at (108, 22) spanning 42 by 94 pixels.
; PLAN: r0=108(x), r1=22(y), r2=42(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 22
LDI r2, 42
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
