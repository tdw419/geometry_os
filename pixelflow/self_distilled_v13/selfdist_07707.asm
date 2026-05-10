; DESCRIPTION: Places a orange 51x32 box at position (55, 123).
; PLAN: r0=55(x), r1=123(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 123
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
