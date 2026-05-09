; DESCRIPTION: Places a red 20x75 rectangle at position (229, 104).
; PLAN: r0=229(x), r1=104(y), r2=20(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 104
LDI r2, 20
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
