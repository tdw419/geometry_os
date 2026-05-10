; DESCRIPTION: Places a orange 104x57 box at position (47, 119).
; PLAN: r0=47(x), r1=119(y), r2=104(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 119
LDI r2, 104
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
