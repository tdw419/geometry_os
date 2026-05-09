; DESCRIPTION: Places a black 22x56 rectangle at position (165, 112).
; PLAN: r0=165(x), r1=112(y), r2=22(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 112
LDI r2, 22
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
