; DESCRIPTION: Places a orange 107x110 rectangle at position (273, 127).
; PLAN: r0=273(x), r1=127(y), r2=107(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 127
LDI r2, 107
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
