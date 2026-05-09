; DESCRIPTION: Places a red 70x79 rectangle at position (204, 145).
; PLAN: r0=204(x), r1=145(y), r2=70(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 145
LDI r2, 70
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
