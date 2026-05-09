; DESCRIPTION: Places a yellow 44x35 rectangle at position (51, 44).
; PLAN: r0=51(x), r1=44(y), r2=44(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 44
LDI r2, 44
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
