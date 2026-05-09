; DESCRIPTION: Creates a red rectangular region at (304, 91) spanning 110 by 103 pixels.
; PLAN: r0=304(x), r1=91(y), r2=110(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 91
LDI r2, 110
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
