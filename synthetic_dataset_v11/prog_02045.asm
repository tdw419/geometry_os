; DESCRIPTION: Creates a red rectangular region at (202, 123) spanning 31 by 91 pixels.
; PLAN: r0=202(x), r1=123(y), r2=31(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 123
LDI r2, 31
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
