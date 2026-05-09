; DESCRIPTION: Places a orange 51x15 rectangle at position (238, 158).
; PLAN: r0=238(x), r1=158(y), r2=51(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 158
LDI r2, 51
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
