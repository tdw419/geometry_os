; DESCRIPTION: Places a black 109x112 rectangle at position (165, 74).
; PLAN: r0=165(x), r1=74(y), r2=109(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 74
LDI r2, 109
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
