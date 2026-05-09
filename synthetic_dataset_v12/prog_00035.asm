; DESCRIPTION: Creates a red rectangular region at (344, 9) spanning 96 by 109 pixels.
; PLAN: r0=344(x), r1=9(y), r2=96(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 9
LDI r2, 96
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
