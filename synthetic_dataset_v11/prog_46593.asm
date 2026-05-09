; DESCRIPTION: Places a red 20x87 rectangle at position (26, 70).
; PLAN: r0=26(x), r1=70(y), r2=20(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 70
LDI r2, 20
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
