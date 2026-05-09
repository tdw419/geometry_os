; DESCRIPTION: Creates a red rectangular region at (217, 91) spanning 81 by 95 pixels.
; PLAN: r0=217(x), r1=91(y), r2=81(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 91
LDI r2, 81
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
