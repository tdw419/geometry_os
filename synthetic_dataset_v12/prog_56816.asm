; DESCRIPTION: Creates a red rectangular region at (203, 187) spanning 49 by 18 pixels.
; PLAN: r0=203(x), r1=187(y), r2=49(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 187
LDI r2, 49
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
