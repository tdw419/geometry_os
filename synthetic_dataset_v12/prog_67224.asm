; DESCRIPTION: Places a red 91x31 rectangle at position (63, 145).
; PLAN: r0=63(x), r1=145(y), r2=91(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 145
LDI r2, 91
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
