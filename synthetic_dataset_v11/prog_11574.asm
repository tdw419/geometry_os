; DESCRIPTION: Creates a red rectangular region at (74, 185) spanning 70 by 18 pixels.
; PLAN: r0=74(x), r1=185(y), r2=70(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 185
LDI r2, 70
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
