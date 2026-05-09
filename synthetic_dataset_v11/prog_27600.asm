; DESCRIPTION: Creates a red rectangular region at (5, 124) spanning 113 by 118 pixels.
; PLAN: r0=5(x), r1=124(y), r2=113(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 124
LDI r2, 113
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
