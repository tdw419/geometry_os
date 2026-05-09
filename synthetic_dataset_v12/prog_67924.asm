; DESCRIPTION: Places a black 44x55 rectangle at position (348, 145).
; PLAN: r0=348(x), r1=145(y), r2=44(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 145
LDI r2, 44
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
