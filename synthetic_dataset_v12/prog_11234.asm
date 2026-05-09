; DESCRIPTION: Places a red 79x110 rectangle at position (175, 141).
; PLAN: r0=175(x), r1=141(y), r2=79(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 141
LDI r2, 79
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
