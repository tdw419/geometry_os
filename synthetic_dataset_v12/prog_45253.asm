; DESCRIPTION: Creates a red rectangular region at (38, 98) spanning 30 by 104 pixels.
; PLAN: r0=38(x), r1=98(y), r2=30(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 98
LDI r2, 30
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
