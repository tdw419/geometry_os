; DESCRIPTION: Places a orange 14x79 rectangle at position (208, 98).
; PLAN: r0=208(x), r1=98(y), r2=14(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 98
LDI r2, 14
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
