; DESCRIPTION: Creates a red rectangular region at (148, 57) spanning 87 by 91 pixels.
; PLAN: r0=148(x), r1=57(y), r2=87(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 57
LDI r2, 87
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
