; DESCRIPTION: Places a orange 51x56 rectangle at position (318, 109).
; PLAN: r0=318(x), r1=109(y), r2=51(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 109
LDI r2, 51
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
