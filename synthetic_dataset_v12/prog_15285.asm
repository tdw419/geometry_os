; DESCRIPTION: Creates a red rectangular region at (121, 109) spanning 97 by 40 pixels.
; PLAN: r0=121(x), r1=109(y), r2=97(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 109
LDI r2, 97
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
