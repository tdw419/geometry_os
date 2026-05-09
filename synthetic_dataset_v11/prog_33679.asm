; DESCRIPTION: Creates a red rectangular region at (16, 104) spanning 89 by 113 pixels.
; PLAN: r0=16(x), r1=104(y), r2=89(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 104
LDI r2, 89
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
