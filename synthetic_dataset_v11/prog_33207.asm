; DESCRIPTION: Creates a red rectangular region at (66, 117) spanning 113 by 100 pixels.
; PLAN: r0=66(x), r1=117(y), r2=113(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 117
LDI r2, 113
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
