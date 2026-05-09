; DESCRIPTION: Places a red 31x81 rectangle at position (368, 90).
; PLAN: r0=368(x), r1=90(y), r2=31(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 90
LDI r2, 31
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
