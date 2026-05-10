; DESCRIPTION: Places a red 12x105 rectangle at position (323, 131).
; PLAN: r0=323(x), r1=131(y), r2=12(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 131
LDI r2, 12
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
