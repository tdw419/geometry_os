; DESCRIPTION: Places a red 79x58 rectangle at position (248, 106).
; PLAN: r0=248(x), r1=106(y), r2=79(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 106
LDI r2, 79
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
