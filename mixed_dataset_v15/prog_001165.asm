; DESCRIPTION: Places a orange 118x75 rectangle at position (272, 150).
; PLAN: r0=272(x), r1=150(y), r2=118(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 150
LDI r2, 118
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
