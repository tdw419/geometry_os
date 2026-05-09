; DESCRIPTION: Places a black 33x43 rectangle at position (106, 145).
; PLAN: r0=106(x), r1=145(y), r2=33(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 145
LDI r2, 33
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
