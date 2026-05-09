; DESCRIPTION: Places a red 17x58 rectangle at position (301, 79).
; PLAN: r0=301(x), r1=79(y), r2=17(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 79
LDI r2, 17
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
