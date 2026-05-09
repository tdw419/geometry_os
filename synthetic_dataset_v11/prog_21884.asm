; DESCRIPTION: Places a red 35x81 rectangle at position (75, 170).
; PLAN: r0=75(x), r1=170(y), r2=35(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 170
LDI r2, 35
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
