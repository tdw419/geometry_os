; DESCRIPTION: Creates a red rectangular region at (183, 91) spanning 103 by 40 pixels.
; PLAN: r0=183(x), r1=91(y), r2=103(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 91
LDI r2, 103
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
