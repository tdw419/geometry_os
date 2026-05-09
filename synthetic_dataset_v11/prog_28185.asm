; DESCRIPTION: Places a black 105x109 rectangle at position (118, 65).
; PLAN: r0=118(x), r1=65(y), r2=105(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 65
LDI r2, 105
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
