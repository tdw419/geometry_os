; DESCRIPTION: Places a magenta 44x51 rectangle at position (468, 18).
; PLAN: r0=468(x), r1=18(y), r2=44(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 18
LDI r2, 44
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
