; DESCRIPTION: Creates a red rectangular region at (128, 104) spanning 25 by 41 pixels.
; PLAN: r0=128(x), r1=104(y), r2=25(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 104
LDI r2, 25
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
