; DESCRIPTION: Places a orange 96x45 rectangle at position (51, 191).
; PLAN: r0=51(x), r1=191(y), r2=96(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 191
LDI r2, 96
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
