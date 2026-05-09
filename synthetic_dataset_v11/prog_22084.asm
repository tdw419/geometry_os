; DESCRIPTION: Creates a white rectangular region at (100, 231) spanning 17 by 18 pixels.
; PLAN: r0=100(x), r1=231(y), r2=17(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 231
LDI r2, 17
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
