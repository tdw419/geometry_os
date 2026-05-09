; DESCRIPTION: Creates a red rectangular region at (462, 135) spanning 24 by 74 pixels.
; PLAN: r0=462(x), r1=135(y), r2=24(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 135
LDI r2, 24
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
