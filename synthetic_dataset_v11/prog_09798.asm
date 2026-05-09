; DESCRIPTION: Creates a red rectangular region at (125, 153) spanning 99 by 65 pixels.
; PLAN: r0=125(x), r1=153(y), r2=99(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 153
LDI r2, 99
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
