; DESCRIPTION: Places a red 37x11 rectangle at position (273, 175).
; PLAN: r0=273(x), r1=175(y), r2=37(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 175
LDI r2, 37
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
