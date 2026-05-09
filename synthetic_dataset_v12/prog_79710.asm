; DESCRIPTION: Creates a yellow rectangular region at (327, 2) spanning 70 by 49 pixels.
; PLAN: r0=327(x), r1=2(y), r2=70(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 2
LDI r2, 70
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
