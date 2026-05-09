; DESCRIPTION: Creates a red rectangular region at (41, 135) spanning 65 by 45 pixels.
; PLAN: r0=41(x), r1=135(y), r2=65(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 135
LDI r2, 65
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
