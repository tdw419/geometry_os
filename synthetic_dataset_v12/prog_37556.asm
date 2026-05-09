; DESCRIPTION: Creates a red rectangular region at (9, 103) spanning 117 by 105 pixels.
; PLAN: r0=9(x), r1=103(y), r2=117(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 103
LDI r2, 117
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
