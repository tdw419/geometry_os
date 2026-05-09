; DESCRIPTION: Creates a red rectangular region at (400, 153) spanning 105 by 81 pixels.
; PLAN: r0=400(x), r1=153(y), r2=105(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 153
LDI r2, 105
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
