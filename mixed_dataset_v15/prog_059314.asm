; DESCRIPTION: Places a orange 79x70 box at position (119, 112).
; PLAN: r0=119(x), r1=112(y), r2=79(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 112
LDI r2, 79
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
