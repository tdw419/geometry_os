; DESCRIPTION: Creates a red rectangular region at (60, 113) spanning 104 by 26 pixels.
; PLAN: r0=60(x), r1=113(y), r2=104(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 113
LDI r2, 104
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
