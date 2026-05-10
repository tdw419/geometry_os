; DESCRIPTION: Creates a orange rectangular region at (333, 175) spanning 81 by 49 pixels.
; PLAN: r0=333(x), r1=175(y), r2=81(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 175
LDI r2, 81
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
