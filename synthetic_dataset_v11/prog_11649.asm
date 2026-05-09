; DESCRIPTION: Places a black 107x106 rectangle at position (102, 124).
; PLAN: r0=102(x), r1=124(y), r2=107(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 124
LDI r2, 107
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
