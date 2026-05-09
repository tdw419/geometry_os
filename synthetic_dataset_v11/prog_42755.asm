; DESCRIPTION: Creates a red rectangular region at (174, 23) spanning 58 by 22 pixels.
; PLAN: r0=174(x), r1=23(y), r2=58(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 23
LDI r2, 58
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
