; DESCRIPTION: Places a orange 51x119 rectangle at position (249, 46).
; PLAN: r0=249(x), r1=46(y), r2=51(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 46
LDI r2, 51
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
