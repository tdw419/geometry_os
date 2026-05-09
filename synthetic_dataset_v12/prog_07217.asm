; DESCRIPTION: Places a orange 21x120 rectangle at position (285, 51).
; PLAN: r0=285(x), r1=51(y), r2=21(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 51
LDI r2, 21
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
