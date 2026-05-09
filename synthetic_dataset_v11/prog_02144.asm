; DESCRIPTION: Creates a red rectangular region at (110, 226) spanning 72 by 18 pixels.
; PLAN: r0=110(x), r1=226(y), r2=72(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 226
LDI r2, 72
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
