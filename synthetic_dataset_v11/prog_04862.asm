; DESCRIPTION: Places a orange 75x30 rectangle at position (171, 104).
; PLAN: r0=171(x), r1=104(y), r2=75(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 104
LDI r2, 75
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
