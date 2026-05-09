; DESCRIPTION: Places a red 83x15 rectangle at position (51, 161).
; PLAN: r0=51(x), r1=161(y), r2=83(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 161
LDI r2, 83
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
