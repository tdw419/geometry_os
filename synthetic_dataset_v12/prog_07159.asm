; DESCRIPTION: Places a black 70x11 rectangle at position (93, 210).
; PLAN: r0=93(x), r1=210(y), r2=70(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 210
LDI r2, 70
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
