; DESCRIPTION: Places a black 107x69 rectangle at position (112, 85).
; PLAN: r0=112(x), r1=85(y), r2=107(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 85
LDI r2, 107
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
