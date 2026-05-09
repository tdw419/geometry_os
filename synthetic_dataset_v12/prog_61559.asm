; DESCRIPTION: Creates a red rectangular region at (399, 11) spanning 91 by 70 pixels.
; PLAN: r0=399(x), r1=11(y), r2=91(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 11
LDI r2, 91
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
