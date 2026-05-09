; DESCRIPTION: Creates a red rectangular region at (20, 121) spanning 55 by 105 pixels.
; PLAN: r0=20(x), r1=121(y), r2=55(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 121
LDI r2, 55
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
