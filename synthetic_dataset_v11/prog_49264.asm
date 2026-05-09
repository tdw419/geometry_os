; DESCRIPTION: Places a yellow 70x51 rectangle at position (83, 92).
; PLAN: r0=83(x), r1=92(y), r2=70(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 92
LDI r2, 70
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
