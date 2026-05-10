; DESCRIPTION: Places a orange 70x115 rectangle at position (223, 119).
; PLAN: r0=223(x), r1=119(y), r2=70(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 119
LDI r2, 70
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
