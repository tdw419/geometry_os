; DESCRIPTION: Creates a red rectangular region at (98, 117) spanning 79 by 34 pixels.
; PLAN: r0=98(x), r1=117(y), r2=79(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 117
LDI r2, 79
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
