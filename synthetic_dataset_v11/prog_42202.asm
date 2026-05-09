; DESCRIPTION: Creates a red rectangular region at (40, 104) spanning 21 by 94 pixels.
; PLAN: r0=40(x), r1=104(y), r2=21(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 104
LDI r2, 21
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
