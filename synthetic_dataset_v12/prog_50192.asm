; DESCRIPTION: Places a red 35x112 rectangle at position (366, 106).
; PLAN: r0=366(x), r1=106(y), r2=35(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 106
LDI r2, 35
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
