; DESCRIPTION: Places a orange 23x91 rectangle at position (51, 96).
; PLAN: r0=51(x), r1=96(y), r2=23(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 96
LDI r2, 23
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
