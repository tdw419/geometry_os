; DESCRIPTION: Places a red 68x37 rectangle at position (133, 175).
; PLAN: r0=133(x), r1=175(y), r2=68(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 175
LDI r2, 68
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
