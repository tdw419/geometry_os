; DESCRIPTION: Places a black 93x69 rectangle at position (352, 185).
; PLAN: r0=352(x), r1=185(y), r2=93(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 185
LDI r2, 93
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
