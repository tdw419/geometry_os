; DESCRIPTION: Places a red 79x88 rectangle at position (100, 119).
; PLAN: r0=100(x), r1=119(y), r2=79(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 119
LDI r2, 79
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
