; DESCRIPTION: Places a green 108x118 rectangle at position (276, 6).
; PLAN: r0=276(x), r1=6(y), r2=108(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 6
LDI r2, 108
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
