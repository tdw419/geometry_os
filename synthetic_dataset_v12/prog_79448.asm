; DESCRIPTION: Places a orange 40x117 rectangle at position (51, 76).
; PLAN: r0=51(x), r1=76(y), r2=40(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 76
LDI r2, 40
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
