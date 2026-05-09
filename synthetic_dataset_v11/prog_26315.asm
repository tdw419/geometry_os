; DESCRIPTION: Places a red 54x104 rectangle at position (85, 121).
; PLAN: r0=85(x), r1=121(y), r2=54(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 121
LDI r2, 54
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
