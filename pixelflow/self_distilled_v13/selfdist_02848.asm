; DESCRIPTION: Places a orange 104x93 box at position (222, 199).
; PLAN: r0=222(x), r1=199(y), r2=104(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 199
LDI r2, 104
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
