; DESCRIPTION: Places a red 37x81 rectangle at position (66, 66).
; PLAN: r0=66(x), r1=66(y), r2=37(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 66
LDI r2, 37
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
