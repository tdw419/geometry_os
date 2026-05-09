; DESCRIPTION: Creates a red rectangular region at (154, 185) spanning 19 by 41 pixels.
; PLAN: r0=154(x), r1=185(y), r2=19(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 185
LDI r2, 19
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
