; DESCRIPTION: Places a red 15x85 box at position (238, 170).
; PLAN: r0=238(x), r1=170(y), r2=15(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 170
LDI r2, 15
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
