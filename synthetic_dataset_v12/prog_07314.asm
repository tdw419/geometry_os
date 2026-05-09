; DESCRIPTION: Places a red 34x96 rectangle at position (172, 104).
; PLAN: r0=172(x), r1=104(y), r2=34(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 104
LDI r2, 34
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
