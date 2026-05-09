; DESCRIPTION: Creates a red rectangular region at (169, 21) spanning 28 by 97 pixels.
; PLAN: r0=169(x), r1=21(y), r2=28(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 21
LDI r2, 28
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
