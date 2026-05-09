; DESCRIPTION: Places a red 87x87 rectangle at position (31, 160).
; PLAN: r0=31(x), r1=160(y), r2=87(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 160
LDI r2, 87
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
