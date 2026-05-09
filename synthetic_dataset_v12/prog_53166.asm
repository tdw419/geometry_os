; DESCRIPTION: Places a green 58x92 rectangle at position (318, 94).
; PLAN: r0=318(x), r1=94(y), r2=58(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 94
LDI r2, 58
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
